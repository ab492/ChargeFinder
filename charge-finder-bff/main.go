package main

import (
	"net/http"

	"github.com/gin-gonic/gin"

	"charge-finder-bff/models"
)

func main() {
	router := gin.Default()
	router.GET("/pages", getPages)
	router.Run("localhost:8080")
}

func getPages(c *gin.Context) {
	pages := []models.Page{
		{
			Name:     "Home",
			Slug:     "home",
			PageType: models.List,
		},
	}
	c.IndentedJSON(http.StatusOK, pages)
}
