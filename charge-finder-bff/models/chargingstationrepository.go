package models

import (
	"fmt"
	"math/rand"
	"time"
)

var allImageUrls = []string{
	"https://images.unsplash.com/photo-1600490819528-42405785433a",
	"https://images.unsplash.com/photo-1669349412975-a9dd0d2292ee",
	"https://images.unsplash.com/photo-1605152276919-a5fd954f2be5",
	"https://images.unsplash.com/photo-1593941707874-ef25b8b4a92b",
	"https://images.unsplash.com/photo-1703860271482-16fd57dc35ca",
	"https://images.unsplash.com/photo-1635451048957-3beb7175f57f",
	"https://images.unsplash.com/photo-1650452233063-8f308616b729",
	"https://images.unsplash.com/photo-1652252421025-0392a97129a3",
	"https://images.unsplash.com/photo-1607171028974-319ba56cb013",
	"https://images.unsplash.com/photo-1671782762232-217c587d7f1f",
	"https://images.unsplash.com/photo-1663579747228-d30eee006200",
	"https://images.unsplash.com/photo-1642271478473-24ab14c4d5f8",
}

var titlePool = []string{
	"MFG EV Power",
	"Shell Recharge",
	"ESB Energy",
	"Tesla Supercharger",
	"Green Charge Station",
	"PowerUp Charging",
	"Volt Express",
	"EcoFlow Energy",
	"Spark Station",
	"Blue Energy Hub",
	"Rapid Charge Point",
	"ChargeGo",
	"SwiftCharge",
	"ElectroPoint",
	"BrightVolt",
	"EnergyNext",
	"QuickVolt",
	"HyperCharge",
	"Ultra EV",
	"Fusion Power Hub",
}

var addressPool = []string{
	"123 Main Street, Springfield",
	"456 Elm Avenue, Metropolis",
	"789 Oak Lane, Gotham",
	"101 Pine Road, Star City",
	"202 Maple Drive, Central City",
	"303 Birch Boulevard, Smallville",
	"404 Cedar Court, Hill Valley",
	"505 Aspen Alley, Twin Peaks",
	"606 Willow Way, Beacon Hills",
	"707 Redwood Street, Sunnydale",
	"808 Cypress Circle, Hawkins",
	"909 Spruce Terrace, Mystic Falls",
	"1100 Chestnut Path, Riverdale",
	"1201 Sycamore Crescent, Derry",
	"1302 Palm Drive, Paradise Falls",
	"1403 Magnolia Lane, Tree Hill",
	"1504 Poplar Close, Pawnee",
	"1605 Alder Street, Dillon",
	"1706 Acacia Boulevard, Neptune",
	"1807 Juniper Walk, Stars Hollow",
}

func getRandomSubset(slice []string, count int) []string {
	rand.Seed(time.Now().UnixNano()) // Seed the random generator
	rand.Shuffle(len(slice), func(i, j int) { slice[i], slice[j] = slice[j], slice[i] })

	// Limit the count to the length of the slice
	if count > len(slice) {
		count = len(slice)
	}

	return slice[:count]
}

func generateStations(count int) []ChargingStation {
	var stations []ChargingStation

	for i := 1; i <= count; i++ {
		station := ChargingStation{
			ID:           fmt.Sprintf("%d", i),
			LocationName: titlePool[rand.Intn(len(titlePool))],
			Address:      addressPool[rand.Intn(len(addressPool))],
			ImageUrls:    getRandomSubset(allImageUrls, rand.Intn(8)+1), // 1-8 random images
		}
		stations = append(stations, station)
	}

	return stations
}

var stations = generateStations(20)

func AllStations() []ChargingStation {
	return stations
}

func StationByID(id string) *ChargingStation {
	for _, station := range stations {
		if station.ID == id {
			return &station
		}
	}
	return nil
}
