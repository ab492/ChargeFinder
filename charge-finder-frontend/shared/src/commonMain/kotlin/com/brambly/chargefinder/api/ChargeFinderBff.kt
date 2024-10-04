package com.brambly.chargefinder.api

import com.brambly.chargefinder.ChargingStationDetail
import com.brambly.chargefinder.ListItem

interface ChargeFinderBff {
    suspend fun fetchHome(): List<ListItem>
    suspend fun fetchDetail(id: String): ChargingStationDetail
}