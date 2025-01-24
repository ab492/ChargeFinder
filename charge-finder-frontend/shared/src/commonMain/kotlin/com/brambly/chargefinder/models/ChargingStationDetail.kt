package com.brambly.chargefinder.models

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
class ChargingStationDetail (
    val title: String,
    val description: String,
    @SerialName("image_urls")
    val images: List<String>
)