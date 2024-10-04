package com.brambly.chargefinder.android.ui

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.brambly.chargefinder.ListItem
import com.brambly.chargefinder.api.ChargeFinderBff
import com.brambly.chargefinder.api.ChargeFinderBffImpl
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch

class ChargingStationListViewModel(private val api: ChargeFinderBff = ChargeFinderBffImpl()) : ViewModel() {
    private val _uiState = MutableStateFlow(ChargingStationListUiState())
    val uiState: StateFlow<ChargingStationListUiState> = _uiState.asStateFlow()

    init {
        fetchChargingStations()
    }

    private fun fetchChargingStations() {
        viewModelScope.launch {
            try {
                val chargingStations: List<ListItem> = api.fetchHome()
                val listItems = chargingStations.map { it.title }
                _uiState.update { currentState ->
                    currentState.copy(
                        chargingStations = listItems,
                        errorMessage = null
                    )
                }
            } catch (e: Exception) {
                _uiState.update { currentState ->
                    currentState.copy(
                        chargingStations = emptyList(),
                        errorMessage = "Sorry, an error has occurred!"
                    )
                }
            }
        }
    }
}