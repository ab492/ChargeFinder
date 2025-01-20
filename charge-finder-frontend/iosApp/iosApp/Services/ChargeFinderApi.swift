import shared

// sourcery: AutoMockable
protocol ChargeFinderApi {
    func fetchChargingStationList() async throws -> [ChargingStationListItem]
    func fetchChargingStationDetail(id: String) async throws -> ChargingStationDetail
}

final class ChargeFinderApiImpl: ChargeFinderApi {
    private let sharedApi = ChargeFinderBffImpl()
    
    func fetchChargingStationList() async throws -> [ChargingStationListItem] {
        try await Task { @MainActor in // Calling Kotlin suspend function must occur from main thread.
            try await sharedApi.fetchHome().map {
                ChargingStationListItem(id: $0.id, title: $0.title)
            }
        }.value
    }
    
    func fetchChargingStationDetail(id: String) async throws -> ChargingStationDetail {
        try await Task { @MainActor in  // Calling Kotlin suspend function must occur from main thread.
            let detail = try await sharedApi.fetchDetail(id: id)
            return ChargingStationDetail(title: detail.title, description: detail.description)
        }.value
    }
}
