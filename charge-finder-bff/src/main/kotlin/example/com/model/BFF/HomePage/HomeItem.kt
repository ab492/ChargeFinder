package example.com.model.BFF.HomePage

import example.com.model.Data.ChargingStation
import kotlinx.serialization.Serializable

@Serializable
data class HomeItem(
    val id: String,
    val title: String,
    val href: String,
) {
    constructor(chargingStation: ChargingStation) : this(
        id = chargingStation.id,
        title = chargingStation.locationName,
        href = "/locations/${chargingStation.id}"
    )
}