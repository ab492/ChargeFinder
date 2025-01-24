package com.brambly.chargefinder.models
import kotlinx.serialization.Serializable

@Serializable
data class ChargingStationListItem (
    val id: String,
    val title: String,
    val details: String,
    var navigationDestination: NavigationDestination
)

