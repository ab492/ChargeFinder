package com.brambly.chargefinder.android.ui.chargingstationlist

data class ChargingStationListUiState(
    val chargingStations: List<String> = emptyList(),
    val errorMessage: String? = null
)

