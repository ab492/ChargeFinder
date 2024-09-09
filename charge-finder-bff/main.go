package main

import (
	"net/http"

	"github.com/gin-gonic/gin"

	"charge-finder-bff/models"
)

func main() {
	router := gin.Default()

	pages := router.Group("/pages")
	{
		pages.GET("", getPages)                                           // /pages
		pages.GET("/home", getHome)                                       // /pages/home
		pages.GET("/chargingStationDetail/:id", getChargingStationDetail) // /pages/chargingStationDetail/{id}
	}

	router.Run("0.0.0.0:8080")
}

func getPages(c *gin.Context) {
	pages := []models.Page{
		{
			Name:     "Home",
			Href:     "/home",
			PageType: models.List,
		},
	}
	c.IndentedJSON(http.StatusOK, pages)
}

func getHome(c *gin.Context) {
	chargingStations := models.AllStations()

	var homeItems []models.HomeItem
	for _, station := range chargingStations {
		detailHref := "/chargingStationDetail/" + station.ID
		homeItem := models.HomeItem{
			ID:    station.ID,
			Title: station.LocationName,
			Action: models.NavigationDestination{
				Href: detailHref,
			},
		}
		homeItems = append(homeItems, homeItem)
	}
	c.IndentedJSON(http.StatusOK, homeItems)
}

func getChargingStationDetail(c *gin.Context) {
	// Get the ID from the URL path parameters
	id := c.Param("id")
	if id == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Missing or invalid ID parameter"})
		return
	}

	// Try to find the charging station by ID
	station := models.StationByID(id)
	if station == nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Charging station not found"})
		return
	}

	chargingStationDetail := models.ChargingStationDetail{
		Title:       station.LocationName,
		Description: station.ID,
	}

	c.IndentedJSON(http.StatusOK, chargingStationDetail)
}
