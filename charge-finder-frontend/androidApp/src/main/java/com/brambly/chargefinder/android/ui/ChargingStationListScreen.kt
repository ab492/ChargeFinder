package com.brambly.chargefinder.android.ui

import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel

@Composable
fun ChargingStationListScreen(
    modifier: Modifier = Modifier,
    listViewModel: ChargingStationListViewModel = viewModel(),
) {
    val listState by listViewModel.uiState.collectAsState()

    LazyColumn(
        modifier = modifier
            .padding(vertical = 4.dp)
            .fillMaxSize()
    ) {
        items(items = listState.chargingStations) { item ->
            ListItem(title = item)
        }
    }
}

@Preview
@Composable
fun ItemListPreview() {
    ChargingStationListScreen()
}