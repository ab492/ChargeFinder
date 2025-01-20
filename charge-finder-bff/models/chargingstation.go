package models

type ChargingStation struct {
	ID           string   `json:"id"`
	LocationName string   `json:"location_name"`
	Address      string   `json:"address"`
	ImageUrls    []string `json:"image_urls"`
}
