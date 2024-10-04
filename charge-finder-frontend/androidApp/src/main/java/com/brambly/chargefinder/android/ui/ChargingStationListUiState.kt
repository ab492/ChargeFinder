package com.brambly.chargefinder.android.ui

data class ChargingStationListUiState(
    val chargingStations: List<String> = emptyList(),
    val errorMessage: String? = null
)