package example.com.model

object ChargingStationRepository {
    private val stations = listOf(
        ChargingStation(id = "1", locationName = "Location 1"),
        ChargingStation(id = "2", locationName = "Location 2"),
        ChargingStation(id = "3", locationName = "Location 3"),
        ChargingStation(id = "4", locationName = "Location 4"),
    )

    fun allStations(): List<ChargingStation> = stations

    fun stationById(id: String) = stations.find {
        it.id.equals(id, ignoreCase = true)
    }
}