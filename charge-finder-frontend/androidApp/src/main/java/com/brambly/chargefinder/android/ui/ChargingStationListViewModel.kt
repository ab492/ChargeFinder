package com.brambly.chargefinder.android.ui

import androidx.lifecycle.ViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow

class ChargingStationListViewModel : ViewModel() {
    private val _uiState = MutableStateFlow(ChargingStationListUiState())
    val uiState: StateFlow<ChargingStationListUiState> = _uiState.asStateFlow()

    init { }
}