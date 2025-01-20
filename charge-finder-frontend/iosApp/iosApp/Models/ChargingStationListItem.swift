import Foundation

struct ChargingStationListItem: Equatable, Identifiable, Hashable {
    let id: String
    let title: String
}

struct ChargingStationDetail: Equatable {
    let title: String
    let description: String
}
