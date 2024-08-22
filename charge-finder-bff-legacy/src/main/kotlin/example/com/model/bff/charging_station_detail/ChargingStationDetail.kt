package example.com.model.bff.charging_station_detail

import example.com.model.Data.ChargingStation
import kotlinx.serialization.Serializable

@Serializable
data class ChargingStationDetail(
    val title: String,
    val description: String,
) {
    constructor(chargingStation: ChargingStation) : this(
        title = chargingStation.locationName,
        description = chargingStation.id
    )
}
