package com.follow.zhuque.services

import com.follow.zhuque.models.VpnOptions

interface BaseServiceInterface {

    fun start(options: VpnOptions): Int

    fun stop()

    suspend fun startForeground(title: String, content: String)
}
