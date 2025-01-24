package com.brambly.chargefinder.api

import com.brambly.chargefinder.ChargingStationDetail
import com.brambly.chargefinder.ListItem
import kotlin.coroutines.cancellation.CancellationException

interface ChargeFinderBff {
    @Throws(ApiException::class, CancellationException::class)
    suspend fun fetchHome(): List<ListItem>
    suspend fun fetchDetail(id: String): ChargingStationDetail
}