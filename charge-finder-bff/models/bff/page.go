package bff

type PageType string

const (
	List PageType = "list"
)

type Page struct {
	Name     string   `json:"name"`
	Href     string   `json:"href"`
	PageType PageType `json:"pageType"`
}
