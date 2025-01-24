package com.brambly.chargefinder.android.ui.chargingstationlist

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.brambly.chargefinder.models.ChargingStationListItem
import com.brambly.chargefinder.api.ChargeFinderBff
import com.brambly.chargefinder.api.ChargeFinderBffImpl
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch

class ChargingStationListViewModel(private val api: ChargeFinderBff = ChargeFinderBffImpl()) : ViewModel() {
    private val _uiState = MutableStateFlow<UiState<List<String>>>(UiState.Loading())
    val uiState: StateFlow<UiState<List<String>>> = _uiState.asStateFlow()

    init {
        fetchChargingStations()
    }

    fun fetchChargingStations() {
        _uiState.value = UiState.Loading()
        viewModelScope.launch {
            try {
                val chargingStations: List<ChargingStationListItem> = api.fetchHome()
                val listItems = chargingStations.map { it.title }
                _uiState.value = UiState.Loaded(listItems)
            } catch (e: Exception) {
                _uiState.value = UiState.Error("Sorry, an error has occurred!")
            }
        }
    }
}