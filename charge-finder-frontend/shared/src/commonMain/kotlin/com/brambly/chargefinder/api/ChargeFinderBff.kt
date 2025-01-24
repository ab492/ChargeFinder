package com.brambly.chargefinder.api

import com.brambly.chargefinder.ChargingStationDetail
import com.brambly.chargefinder.ListItem

interface ChargeFinderBff {
    @Throws(Exception::class)
    suspend fun fetchHome(): List<ListItem>
    suspend fun fetchDetail(id: String): ChargingStationDetail
}