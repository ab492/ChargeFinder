package example.com.model.Data

import kotlinx.serialization.Serializable

@Serializable
data class ChargingStation(
    val id: String,
    val locationName: String
)