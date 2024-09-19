package com.brambly.chargefinder.android

import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun ItemList(
    modifier: Modifier = Modifier,
    items: List<String> = List(1000) { "Title $it" }
) {
    LazyColumn(
        modifier = modifier
        .padding(vertical = 4.dp)
        .fillMaxSize()
    ) {
        items(items = items) { item ->
            ListItem(title = item)
        }
    }
}

@Preview
@Composable
fun ItemListPreview() {
    ItemList()
}