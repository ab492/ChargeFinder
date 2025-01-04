import shared

// sourcery: AutoMockable
protocol ChargeFinderApi {
    func fetch() async throws -> [ChargingStationListItem]
    
}

final class ChargeFinderApiImpl: ChargeFinderApi {
    private let sharedApi = ChargeFinderBffImpl()
    
    func fetch() async throws -> [ChargingStationListItem] {
        try await Task { @MainActor in // Calling Kotlin suspend function must occur from main thread.
            try await sharedApi.fetchHome().map {
                ChargingStationListItem(id: $0.id, title: $0.title)
            }
        }.value
    }
}
