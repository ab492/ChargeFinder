package models

type Page struct {
	Name     string   `json:"name"`
	Slug     string   `json:"slug"`
	PageType PageType `json:"pageType"`
}
