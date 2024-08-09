package example.com.model.bff.homepage

import example.com.model.Data.ChargingStation
import example.com.model.bff.navigation.NavigationAction
import kotlinx.serialization.Serializable

// TODO: LEFT OF HERE TRYING TO ADD ACTION
@Serializable
data class HomeItem(
    val id: String,
    val title: String,
    var navigationAction: NavigationAction
) {
    constructor(
        chargingStation: ChargingStation,
        navigationAction: NavigationAction
        ) : this(
        id = chargingStation.id,
        title = chargingStation.locationName,
        navigationAction = navigationAction
    )
}