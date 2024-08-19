package com.brambly.chargefinder

import kotlinx.serialization.Serializable

@Serializable
class ChargingStationDetail (
    val title: String,
    val description: String
)