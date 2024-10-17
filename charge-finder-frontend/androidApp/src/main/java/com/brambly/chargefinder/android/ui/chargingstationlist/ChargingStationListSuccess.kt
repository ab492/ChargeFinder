package com.brambly.chargefinder.android.ui.chargingstationlist

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun ChargingStationListSuccess(
    items: List<String>,
    modifier: Modifier = Modifier
) {
    LazyColumn(
        modifier = modifier
            .background(Color.Red)
            .padding(vertical = 50.dp, horizontal = 40.dp)
            .fillMaxSize()
    ) {
        items(items = items) { item ->
            ListItem(title = item)
        }
    }
}

@Preview
@Composable
fun ChargingStationListContentPreview() {
    ChargingStationListSuccess(items =
        listOf("Charging Station 1", "Longer Charging Station 2")
    )
}