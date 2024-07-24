package example.com.model

fun ChargingStation.toHomeItem(): HomeItem {
    return HomeItem(
        id = this.id,
        title = this.locationName,
        href = "/locations/${this.id}"
    )
}

fun List<ChargingStation>.toHomeItems(): List<HomeItem> {
    return this.map { it.toHomeItem()}
}