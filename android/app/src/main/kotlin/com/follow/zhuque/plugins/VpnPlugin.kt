package com.follow.zhuque.plugins

import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.net.NetworkRequest
import android.os.Build
import android.os.IBinder
import android.util.Log
import androidx.core.content.getSystemService
import com.follow.zhuque.ZhuqueJiasuApplication
import com.follow.zhuque.GlobalState
import com.follow.zhuque.RunState
import com.follow.zhuque.extensions.awaitResult
import com.follow.zhuque.extensions.getProtocol
import com.follow.zhuque.extensions.resolveDns
import com.follow.zhuque.models.Process
import com.follow.zhuque.models.StartForegroundParams
import com.follow.zhuque.models.VpnOptions
import com.follow.zhuque.services.BaseServiceInterface
import com.follow.zhuque.services.ZhuqueJiasuService
import com.follow.zhuque.services.ZhuqueJiasuVpnService
import com.google.gson.Gson
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.isActive
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.net.InetSocketAddress
import kotlin.concurrent.withLock

data object VpnPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var flutterMethodChannel: MethodChannel
    private var zhuqueJiasuService: BaseServiceInterface? = null
    private lateinit var options: VpnOptions
    private lateinit var scope: CoroutineScope
    private var lastStartForegroundParams: StartForegroundParams? = null
    private var timerJob: Job? = null

    private val connectivity by lazy {
        ZhuqueJiasuApplication.getAppContext().getSystemService<ConnectivityManager>()
    }

    private val connection = object : ServiceConnection {
        override fun onServiceConnected(className: ComponentName, service: IBinder) {
            zhuqueJiasuService = when (service) {
                is ZhuqueJiasuVpnService.LocalBinder -> service.getService()
                is ZhuqueJiasuService.LocalBinder -> service.getService()
                else -> throw Exception("invalid binder")
            }
            handleStartService()
        }

        override fun onServiceDisconnected(arg: ComponentName) {
            zhuqueJiasuService = null
        }
    }

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        scope = CoroutineScope(Dispatchers.Default)
        scope.launch {
            registerNetworkCallback()
        }
        flutterMethodChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "vpn")
        flutterMethodChannel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        unRegisterNetworkCallback()
        flutterMethodChannel.setMethodCallHandler(null)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "start" -> {
                val data = call.argument<String>("data")
                result.success(handleStart(Gson().fromJson(data, VpnOptions::class.java)))
            }

            "stop" -> {
                handleStop()
                result.success(true)
            }

            "setProtect" -> {
                val fd = call.argument<Int>("fd")
                if (fd != null && zhuqueJiasuService is ZhuqueJiasuVpnService) {
                    try {
                        (zhuqueJiasuService as ZhuqueJiasuVpnService).protect(fd)
                        result.success(true)
                    } catch (e: RuntimeException) {
                        result.success(false)
                    }
                } else {
                    result.success(false)
                }
            }

            "resolverProcess" -> {
                val data = call.argument<String>("data")
                val process = if (data != null) Gson().fromJson(
                    data, Process::class.java
                ) else null
                val metadata = process?.metadata
                if (metadata == null) {
                    result.success(null)
                    return
                }
                val protocol = metadata.getProtocol()
                if (protocol == null) {
                    result.success(null)
                    return
                }
                scope.launch {
                    withContext(Dispatchers.Default) {
                        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) {
                            result.success(null)
                            return@withContext
                        }
                        val src = InetSocketAddress(metadata.sourceIP, metadata.sourcePort)
                        val dst = InetSocketAddress(
                            metadata.destinationIP.ifEmpty { metadata.host },
                            metadata.destinationPort
                        )
                        val uid = try {
                            connectivity?.getConnectionOwnerUid(protocol, src, dst)
                        } catch (_: Exception) {
                            null
                        }
                        if (uid == null || uid == -1) {
                            result.success(null)
                            return@withContext
                        }
                        val packages =
                            ZhuqueJiasuApplication.getAppContext().packageManager?.getPackagesForUid(uid)
                        result.success(packages?.first())
                    }
                }
            }

            else -> {
                result.notImplemented()
            }
        }
    }

    fun handleStart(options: VpnOptions): Boolean {
        this.options = options
        when (options.enable) {
            true -> handleStartVpn()
            false -> handleStartService()
        }
        return true
    }

    private fun handleStartVpn() {
        GlobalState.getCurrentAppPlugin()
            ?.requestVpnPermission {
                handleStartService()
            }
    }

    fun requestGc() {
        flutterMethodChannel.invokeMethod("gc", null)
    }

    val networks = mutableSetOf<Network>()

    fun onUpdateNetwork() {
        val dns = networks.flatMap { network ->
            connectivity?.resolveDns(network) ?: emptyList()
        }.toSet().joinToString(",")
        scope.launch {
            withContext(Dispatchers.Main) {
                flutterMethodChannel.invokeMethod("dnsChanged", dns)
            }
        }
    }

    private val callback = object : ConnectivityManager.NetworkCallback() {
        override fun onAvailable(network: Network) {
            networks.add(network)
            onUpdateNetwork()
        }

        override fun onLost(network: Network) {
            networks.remove(network)
            onUpdateNetwork()
        }
    }

    private val request = NetworkRequest.Builder().apply {
        addCapability(NetworkCapabilities.NET_CAPABILITY_NOT_VPN)
        addCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
        addCapability(NetworkCapabilities.NET_CAPABILITY_NOT_RESTRICTED)
    }.build()

    private fun registerNetworkCallback() {
        networks.clear()
        connectivity?.registerNetworkCallback(request, callback)
    }

    private fun unRegisterNetworkCallback() {
        connectivity?.unregisterNetworkCallback(callback)
        networks.clear()
        onUpdateNetwork()
    }

    private suspend fun startForeground() {
        GlobalState.runLock.lock()
        try {
            if (GlobalState.runState.value != RunState.START) return
            val data = flutterMethodChannel.awaitResult<String>("getStartForegroundParams")
            val startForegroundParams = Gson().fromJson(
                data, StartForegroundParams::class.java
            )
            if (lastStartForegroundParams != startForegroundParams) {
                lastStartForegroundParams = startForegroundParams
                zhuqueJiasuService?.startForeground(
                    startForegroundParams.title,
                    startForegroundParams.content,
                )
            }
        } finally {
            GlobalState.runLock.unlock()
        }
    }

    private fun startForegroundJob() {
        timerJob = CoroutineScope(Dispatchers.Main).launch {
            while (isActive) {
                startForeground()
                delay(1000)
            }
        }
    }

    private fun stopForegroundJob() {
        timerJob?.cancel()
        timerJob = null
    }

    private fun handleStartService() {
        if (zhuqueJiasuService == null) {
            bindService()
            return
        }
        GlobalState.runLock.withLock {
            if (GlobalState.runState.value == RunState.START) return
            GlobalState.runState.value = RunState.START
            val fd = zhuqueJiasuService?.start(options)
            flutterMethodChannel.invokeMethod(
                "started", fd
            )
            startForegroundJob();
        }
    }

    fun handleStop() {
        GlobalState.runLock.withLock {
            if (GlobalState.runState.value == RunState.STOP) return
            GlobalState.runState.value = RunState.STOP
            stopForegroundJob()
            zhuqueJiasuService?.stop()
            GlobalState.handleTryDestroy()
        }
    }

    private fun bindService() {
        val intent = when (options.enable) {
            true -> Intent(ZhuqueJiasuApplication.getAppContext(), ZhuqueJiasuVpnService::class.java)
            false -> Intent(ZhuqueJiasuApplication.getAppContext(), ZhuqueJiasuService::class.java)
        }
        ZhuqueJiasuApplication.getAppContext().bindService(intent, connection, Context.BIND_AUTO_CREATE)
    }
}
