package com.brambly.chargefinder.android.ui

import androidx.compose.foundation.layout.padding
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun ListItem(title: String, modifier: Modifier = Modifier) {
        Surface(
            color = MaterialTheme.colorScheme.primary,
            modifier = modifier.padding(vertical = 8.dp, horizontal = 8.dp)
        ) {
            Text(text = title, style = MaterialTheme.typography.headlineLarge)
        }
}

@Preview
@Composable
fun ListItemPreview() {
    ListItem(title = "Charging Station 1")
}