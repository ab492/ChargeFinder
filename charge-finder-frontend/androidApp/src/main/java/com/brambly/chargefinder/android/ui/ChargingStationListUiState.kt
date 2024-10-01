package com.brambly.chargefinder.android.ui

data class ChargingStationListUiState(
    val chargingStations: List<String> = List(1000) { "Title Hello $it" }
)