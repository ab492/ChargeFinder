package bff

type HomeItem struct {
	ID     string                `json:"id"`
	Title  string                `json:"title"`
	Action NavigationDestination `json:"navigationDestination"`
}

type NavigationDestination struct {
	Href string `json:"href"`
}