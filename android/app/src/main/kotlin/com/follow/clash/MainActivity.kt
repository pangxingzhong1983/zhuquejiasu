package com.follow.clash

import com.follow.clash.plugins.AppPlugin
import com.follow.clash.plugins.ServicePlugin
import com.follow.clash.plugins.TilePlugin
import io.flutter.embedding.android.FlutterActivity
import android.util.Log
import android.os.SystemClock
import io.flutter.embedding.engine.FlutterEngine

import io.flutter.plugin.common.MethodChannel
import android.content.Intent
import android.net.Uri
import androidx.core.content.FileProvider
import java.io.File

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        val start = SystemClock.elapsedRealtime()
        Log.d("ZhuqueGlobal", "MainActivity.configureFlutterEngine: start at ${start}ms thread=${Thread.currentThread().name}")
    super.configureFlutterEngine(flutterEngine)
    // Expose the primary FlutterEngine to GlobalState early so plugin
    // method calls that run during startup can observe that the main
    // engine is present. This avoids a race where initServiceEngine
    // treats the main engine as absent and forces a "quick" service
    // startup mode that may terminate the whole process.
    GlobalState.flutterEngine = flutterEngine
    flutterEngine.plugins.add(AppPlugin())
    flutterEngine.plugins.add(ServicePlugin)
    flutterEngine.plugins.add(TilePlugin())
        val end = SystemClock.elapsedRealtime()
        Log.d("ZhuqueGlobal", "MainActivity.configureFlutterEngine: completed in ${end - start}ms")

        // 添加安装APK的通道
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.example.app/install")
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "installApk" -> {
                        val filePath = call.argument<String>("filePath")
                        if (filePath != null) {
                            try {
                                val intent = Intent(Intent.ACTION_VIEW)
                                intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                                intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                                val uri = FileProvider.getUriForFile(
                                    context,
                                    "${context.packageName}.fileProvider",
                                    File(filePath)
                                )
                                intent.setDataAndType(uri, "application/vnd.android.package-archive")
                                startActivity(intent)
                                result.success(true)
                            } catch (e: Exception) {
                                result.error("INSTALL_ERROR", e.message, null)
                            }
                        } else {
                            result.error("INVALID_PATH", "文件路径不能为空", null)
                        }
                    }
                    else -> result.notImplemented()
                }
            }
    }

    override fun onDestroy() {
        GlobalState.flutterEngine = null
        super.onDestroy()
    }
}