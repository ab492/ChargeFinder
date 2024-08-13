package example.com.model.bff.homepage

import example.com.model.Data.ChargingStation
import example.com.model.bff.navigation.Action
import kotlinx.serialization.Serializable

@Serializable
data class HomeItem(
    val id: String,
    val title: String,
    var action: Action
) {
    constructor(
        chargingStation: ChargingStation,
        action: Action
        ) : this(
        id = chargingStation.id,
        title = chargingStation.locationName,
        action = action
    )
}