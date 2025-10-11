package com.follow.zhuque.services

import android.annotation.SuppressLint
import android.app.Notification.FOREGROUND_SERVICE_IMMEDIATE
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Intent
import android.content.pm.ServiceInfo.FOREGROUND_SERVICE_TYPE_SPECIAL_USE
import android.os.Binder
import android.os.Build
import android.os.IBinder
import androidx.core.app.NotificationCompat
import com.follow.zhuque.GlobalState
import com.follow.zhuque.MainActivity
import com.follow.zhuque.extensions.getActionPendingIntent
import com.follow.zhuque.models.VpnOptions
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Deferred
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async


class ZhuqueJiasuService : Service(), BaseServiceInterface {

    private val binder = LocalBinder()

    inner class LocalBinder : Binder() {
        fun getService(): ZhuqueJiasuService = this@ZhuqueJiasuService
    }

    override fun onBind(intent: Intent): IBinder {
        return binder
    }

    override fun onUnbind(intent: Intent?): Boolean {
        return super.onUnbind(intent)
    }

    private val CHANNEL = "ZhuqueJiasu"

    private val notificationId: Int = 1

    private val notificationBuilderDeferred: Deferred<NotificationCompat.Builder> by lazy {
        CoroutineScope(Dispatchers.Main).async {
            val stopText = GlobalState.getText("stop")

            val intent = Intent(
                this@ZhuqueJiasuService, MainActivity::class.java
            )

            val pendingIntent = if (Build.VERSION.SDK_INT >= 31) {
                PendingIntent.getActivity(
                    this@ZhuqueJiasuService,
                    0,
                    intent,
                    PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT
                )
            } else {
                PendingIntent.getActivity(
                    this@ZhuqueJiasuService,
                    0,
                    intent,
                    PendingIntent.FLAG_UPDATE_CURRENT
                )
            }

            with(NotificationCompat.Builder(this@ZhuqueJiasuService, CHANNEL)) {
                setSmallIcon(com.follow.zhuque.R.drawable.ic_stat_name)
                setContentTitle("ZhuqueJiasu")
                setContentIntent(pendingIntent)
                setCategory(NotificationCompat.CATEGORY_SERVICE)
                priority = NotificationCompat.PRIORITY_MIN
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                    foregroundServiceBehavior = FOREGROUND_SERVICE_IMMEDIATE
                }
                addAction(
                    0,
                    stopText, // 使用 suspend 函数获取的文本
                    getActionPendingIntent("STOP")
                )
                setOngoing(true)
                setShowWhen(false)
                setOnlyAlertOnce(true)
                setAutoCancel(true)
            }
        }
    }
    private suspend fun getNotificationBuilder(): NotificationCompat.Builder {
        return notificationBuilderDeferred.await()
    }

    override fun start(options: VpnOptions) = 0

    override fun stop() {
        stopSelf()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            stopForeground(STOP_FOREGROUND_REMOVE)
        }
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
                .setContentText(content).build()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            startForeground(notificationId, notification, FOREGROUND_SERVICE_TYPE_SPECIAL_USE)
        } else {
            startForeground(notificationId, notification)
        }
    }
}
