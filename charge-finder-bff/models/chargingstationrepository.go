package models

var stations = []ChargingStation{
	{ID: "1", LocationName: "Location 1"},
	{ID: "2", LocationName: "Location 2"},
	{ID: "3", LocationName: "Location 3"},
	{ID: "4", LocationName: "Location 4"},
}

func AllStations() []ChargingStation {
	return stations
}
