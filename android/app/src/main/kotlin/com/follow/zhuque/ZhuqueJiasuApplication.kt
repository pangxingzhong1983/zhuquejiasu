package com.follow.zhuque

import android.app.Application
import android.content.Context

class ZhuqueJiasuApplication : Application() {
    companion object {
        private lateinit var instance: ZhuqueJiasuApplication
        fun getAppContext(): Context {
            return instance.applicationContext
        }
    }

    override fun onCreate() {
        super.onCreate()
        instance = this
    }
}
