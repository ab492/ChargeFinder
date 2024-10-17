package com.brambly.chargefinder.android.ui.chargingstationlist

//data class ChargingStationListUiState(
//    val chargingStations: List<String> = emptyList(),
//    val errorMessage: String? = null
//)

sealed class UiState<T> {
    class Loading<T>: UiState<T>()
    data class Error<T>(val error: String) : UiState<T>()
    data class Loaded<T>(val data: T): UiState<T>()
}