import Foundation

extension ChargingStationListItem {
    static let mock: ChargingStationListItem = .init(
        id: "123",
        title: "Super Charging Station",
        details: "707 Redwood Street, Sunnydale"
    )
}

extension ChargingStationDetail {
    static let mock: ChargingStationDetail = .init(
        title: "Super Charging Station",
        description: "707 Redwood Street, Sunnydale",
        images: [URL(string: "www.some-mock-image-url.co.uk")!]
    )
}
