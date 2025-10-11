package com.follow.zhuque.services

import android.annotation.SuppressLint
import android.app.Notification.FOREGROUND_SERVICE_IMMEDIATE
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Intent
import android.content.pm.ServiceInfo.FOREGROUND_SERVICE_TYPE_SPECIAL_USE
import android.net.ProxyInfo
import android.net.VpnService
import android.os.Binder
import android.os.Handler
import android.os.Looper
import android.os.SystemClock
import android.os.Build
import android.os.IBinder
import android.os.Parcel
import android.os.RemoteException
import android.util.Log
import androidx.core.app.NotificationCompat
import com.follow.zhuque.GlobalState
import com.follow.zhuque.MainActivity
import com.follow.zhuque.R
import com.follow.zhuque.extensions.getActionPendingIntent
import com.follow.zhuque.extensions.getIpv4RouteAddress
import com.follow.zhuque.extensions.getIpv6RouteAddress
import com.follow.zhuque.extensions.toCIDR
import com.follow.zhuque.models.AccessControlMode
import com.follow.zhuque.models.VpnOptions
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Deferred
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
import kotlinx.coroutines.launch


class ZhuqueJiasuVpnService : VpnService(), BaseServiceInterface {
    override fun onCreate() {
        super.onCreate()
        // Do not initialize the service FlutterEngine synchronously in onCreate()
        // to avoid blocking the app's early startup frames. Initialization is
        // performed lazily when the service actually starts.
        Log.d("ZhuqueGlobal", "ZhuqueJiasuVpnService.onCreate: created at ${SystemClock.elapsedRealtime()}ms thread=${Thread.currentThread().name}")
    }

    override fun start(options: VpnOptions): Int {
        return with(Builder()) {
            if (options.ipv4Address.isNotEmpty()) {
                val cidr = options.ipv4Address.toCIDR()
                addAddress(cidr.address, cidr.prefixLength)
                val routeAddress = options.getIpv4RouteAddress()
                if (routeAddress.isNotEmpty()) {
                    routeAddress.forEach { i ->
                        Log.d("addRoute4", "address: ${i.address} prefixLength:${i.prefixLength}")
                        addRoute(i.address, i.prefixLength)
                    }
                } else {
                    addRoute("0.0.0.0", 0)
                }
            }
            if (options.ipv6Address.isNotEmpty()) {
                val cidr = options.ipv6Address.toCIDR()
                addAddress(cidr.address, cidr.prefixLength)
                val routeAddress = options.getIpv6RouteAddress()
                if (routeAddress.isNotEmpty()) {
                    routeAddress.forEach { i ->
                        Log.d("addRoute6", "address: ${i.address} prefixLength:${i.prefixLength}")
                        addRoute(i.address, i.prefixLength)
                    }
                } else {
                    addRoute("::", 0)
                }
            }
            addDnsServer(options.dnsServerAddress)
            setMtu(9000)
            options.accessControl.let { accessControl ->
                if (accessControl.enable) {
                    when (accessControl.mode) {
                        AccessControlMode.acceptSelected -> {
                            (accessControl.acceptList + packageName).forEach {
                                addAllowedApplication(it)
                            }
                        }

                        AccessControlMode.rejectSelected -> {
                            (accessControl.rejectList - packageName).forEach {
                                addDisallowedApplication(it)
                            }
                        }
                    }
                }
            }
            setSession("ZhuqueJiasu")
            setBlocking(false)
            if (Build.VERSION.SDK_INT >= 29) {
                setMetered(false)
            }
            if (options.allowBypass) {
                allowBypass()
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q && options.systemProxy) {
                setHttpProxy(
                    ProxyInfo.buildDirectProxy(
                        "127.0.0.1",
                        options.port,
                        options.bypassDomain
                    )
                )
            }
            // Establish the VPN and keep the detachFd result as the lambda's
            // final expression so this function returns Int as expected.
            val fdResult = establish()?.detachFd()
                ?: throw NullPointerException("Establish VPN rejected by system")

            // Schedule service engine initialization a short time after the
            // VPN is established so we avoid doing heavy native->Dart handoff
            // during critical UI startup. GlobalState contains its own guards
            // to make init idempotent. Scheduling is fire-and-forget; it does
            // not change the returned fdResult.
            try {
                val mainHandler = Handler(Looper.getMainLooper())
                mainHandler.post {
                    Log.d("ZhuqueGlobal", "ZhuqueJiasuVpnService: initializing service engine immediately after VPN start at ${SystemClock.elapsedRealtime()}ms")
                    GlobalState.initServiceEngine()
                }
            } catch (e: Exception) {
                Log.w("ZhuqueGlobal", "Failed to schedule initServiceEngine from ZhuqueJiasuVpnService.start", e)
                // Best-effort fallback: call directly (GlobalState will guard duplicates)
                GlobalState.initServiceEngine()
            }

            fdResult
        }
    }

    override fun stop() {
        stopSelf()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            stopForeground(STOP_FOREGROUND_REMOVE)
        }
    }

    private val CHANNEL = "ZhuqueJiasu"

    private val notificationId: Int = 1

    private val notificationBuilderDeferred: Deferred<NotificationCompat.Builder> by lazy {
        CoroutineScope(Dispatchers.Main).async {
            val stopText = GlobalState.getText("stop")
            val intent = Intent(this@ZhuqueJiasuVpnService, MainActivity::class.java)

            val pendingIntent = if (Build.VERSION.SDK_INT >= 31) {
                PendingIntent.getActivity(
                    this@ZhuqueJiasuVpnService,
                    0,
                    intent,
                    PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT
                )
            } else {
                PendingIntent.getActivity(
                    this@ZhuqueJiasuVpnService,
                    0,
                    intent,
                    PendingIntent.FLAG_UPDATE_CURRENT
                )
            }

            with(NotificationCompat.Builder(this@ZhuqueJiasuVpnService, CHANNEL)) {
                setSmallIcon(R.drawable.ic_stat_name)
                setContentTitle("ZhuqueJiasu")
                setContentIntent(pendingIntent)
                setCategory(NotificationCompat.CATEGORY_SERVICE)
                priority = NotificationCompat.PRIORITY_MIN
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                    foregroundServiceBehavior = FOREGROUND_SERVICE_IMMEDIATE
                }
                setOngoing(true)
                addAction(
                    0,
                    stopText,
                    getActionPendingIntent("STOP")
                )
                setShowWhen(false)
                setOnlyAlertOnce(true)
                setAutoCancel(true)
            }
        }
    }

    private suspend fun getNotificationBuilder(): NotificationCompat.Builder {
        return notificationBuilderDeferred.await()
    }

    @SuppressLint("ForegroundServiceType", "WrongConstant")
    override suspend fun startForeground(title: String, content: String) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val manager = getSystemService(NotificationManager::class.java)
            var channel = manager?.getNotificationChannel(CHANNEL)
            if (channel == null) {
                channel =
                    NotificationChannel(CHANNEL, "ZhuqueJiasu", NotificationManager.IMPORTANCE_LOW)
                manager?.createNotificationChannel(channel)
            }
        }
        val notification =
            getNotificationBuilder()
                .setContentTitle(title)
                .setContentText(content)
                .build()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            startForeground(notificationId, notification, FOREGROUND_SERVICE_TYPE_SPECIAL_USE)
        } else {
            startForeground(notificationId, notification)
        }
    }

    override fun onTrimMemory(level: Int) {
        super.onTrimMemory(level)
        GlobalState.getCurrentVPNPlugin()?.requestGc()
    }

    private val binder = LocalBinder()

    inner class LocalBinder : Binder() {
        fun getService(): ZhuqueJiasuVpnService = this@ZhuqueJiasuVpnService

        override fun onTransact(code: Int, data: Parcel, reply: Parcel?, flags: Int): Boolean {
            try {
                val isSuccess = super.onTransact(code, data, reply, flags)
                if (!isSuccess) {
                    CoroutineScope(Dispatchers.Main).launch {
                        GlobalState.getCurrentTilePlugin()?.handleStop()
                    }
                }
                return isSuccess
            } catch (e: RemoteException) {
                throw e
            }
        }
    }

    override fun onBind(intent: Intent): IBinder {
        return binder
    }

    override fun onUnbind(intent: Intent?): Boolean {
        return super.onUnbind(intent)
    }

    override fun onDestroy() {
        stop()
        super.onDestroy()
    }
}
