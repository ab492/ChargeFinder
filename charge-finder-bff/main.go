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
		pages.GET("", getPages)     // /pages
		pages.GET("/home", getHome) // /pages/home
	}

	router.Run("localhost:8080")
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
