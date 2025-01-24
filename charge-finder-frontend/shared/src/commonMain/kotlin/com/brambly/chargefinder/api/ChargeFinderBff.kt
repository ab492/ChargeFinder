package com.brambly.chargefinder.api

import com.brambly.chargefinder.models.ChargingStationDetail
import com.brambly.chargefinder.models.ChargingStationListItem
import kotlin.coroutines.cancellation.CancellationException

interface ChargeFinderBff {
    @Throws(ApiException::class, CancellationException::class)
    suspend fun fetchHome(): List<ChargingStationListItem>

    @Throws(ApiException::class, CancellationException::class)
    suspend fun fetchDetail(id: String): ChargingStationDetail
}