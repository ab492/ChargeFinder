package main

import (
	"fmt"

	"charge-finder-bff/models"
)

func main() {
	page := models.Page{
		Name:     "home",
		Slug:     "/home",
		PageType: models.List,
	}
	fmt.Println("Page:", page)
}
