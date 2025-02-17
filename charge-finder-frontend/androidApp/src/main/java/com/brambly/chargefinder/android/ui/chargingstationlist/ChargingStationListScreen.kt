package com.brambly.chargefinder.android.ui.chargingstationlist

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.CenterAlignedTopAppBar
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import com.brambly.chargefinder.android.ui.reusable.ErrorScreen
import com.brambly.chargefinder.android.ui.reusable.LoadingScreen

@ExperimentalMaterial3Api
@Composable
fun ChargingStationListScreen(
    modifier: Modifier = Modifier,
    listViewModel: ChargingStationListViewModel = viewModel(),
) {
    val listState by listViewModel.uiState.collectAsState()

    Scaffold(
        topBar = {
            CenterAlignedTopAppBar(title = { Text("Home") })
        }
    ) { paddingValues ->
        Column(modifier = Modifier.padding(paddingValues)) {
            when (val state = listState) {
                is UiState.Loading -> LoadingScreen()
                is UiState.Loaded  -> ChargingStationListSuccess(items = state.data)
                is UiState.Error -> ErrorScreen(errorText = state.error) {
                    listViewModel.fetchChargingStations()
                }
            }
        }
    }
}