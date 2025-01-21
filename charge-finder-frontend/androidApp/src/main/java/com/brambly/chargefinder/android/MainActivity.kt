@file:OptIn(ExperimentalMaterial3Api::class)

package com.brambly.chargefinder.android

import android.os.Bundle
import android.util.Log
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import com.brambly.chargefinder.android.ui.chargingstationlist.ChargingStationListScreen
import com.brambly.chargefinder.api.ChargeFinderBffImpl
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

class MainActivity : ComponentActivity() {
    private val chargeFinderBff = ChargeFinderBffImpl()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        testFetchDetail("3") // Replace "3" with the desired ID


        setContent {
            MyApplicationTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    ChargingStationListScreen()
                }
            }
        }
    }

    private fun testFetchDetail(id: String) {
        CoroutineScope(Dispatchers.IO).launch {
            try {
                val response = chargeFinderBff.fetchDetail(id)
                withContext(Dispatchers.Main) {
                    Log.d("MainActivity", "Fetched detail: $response")
                }
            } catch (e: Exception) {
                withContext(Dispatchers.Main) {
                    Log.e("MainActivity", "Error fetching detail: ${e.message}", e)
                }
            }
        }
    }
}



@Preview
@Composable
fun DefaultPreview() {
    MyApplicationTheme {
        ChargingStationListScreen()
    }
}
