package com.follow.zhuque.plugins

import com.follow.zhuque.ZhuqueJiasuApplication
import android.util.Log
import android.os.SystemClock
import com.follow.zhuque.GlobalState
import com.follow.zhuque.models.VpnOptions
import com.google.gson.Gson
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


data object ServicePlugin : FlutterPlugin, MethodChannel.MethodCallHandler {

    private lateinit var flutterMethodChannel: MethodChannel

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        val t0 = SystemClock.elapsedRealtime()
        Log.d("ZhuqueGlobal", "ServicePlugin.onAttachedToEngine: start at ${t0}ms thread=${Thread.currentThread().name}")
        flutterMethodChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "service")
        flutterMethodChannel.setMethodCallHandler(this)
        val t1 = SystemClock.elapsedRealtime()
        Log.d("ZhuqueGlobal", "ServicePlugin.onAttachedToEngine: done in ${t1 - t0}ms")
    }

    override fun onDetachedFromEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        flutterMethodChannel.setMethodCallHandler(null)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) = when (call.method) {
        "startVpn" -> {
            val data = call.argument<String>("data")
            val options = Gson().fromJson(data, VpnOptions::class.java)
            GlobalState.getCurrentVPNPlugin()?.handleStart(options)
            result.success(true)
        }

        "stopVpn" -> {
            GlobalState.getCurrentVPNPlugin()?.handleStop()
            result.success(true)
        }

        "init" -> {
            val calledAt = SystemClock.elapsedRealtime()
            Log.d("ZhuqueGlobal", "ServicePlugin.init method called at ${calledAt}ms thread=${Thread.currentThread().name}")
            GlobalState.getCurrentAppPlugin()?.requestNotificationsPermission()
            GlobalState.initServiceEngine()
            Log.d("ZhuqueGlobal", "ServicePlugin.init: dispatched initServiceEngine")
            result.success(true)
        }

        "destroy" -> {
            handleDestroy()
            result.success(true)
        }

        else -> {
            result.notImplemented()
        }
    }

    private fun handleDestroy() {
        GlobalState.getCurrentVPNPlugin()?.handleStop()
        GlobalState.destroyServiceEngine()
    }
}
