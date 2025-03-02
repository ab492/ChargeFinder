import shared

// sourcery: AutoMockable
protocol ChargeFinderApi {
    func fetchChargingStationList() async throws -> [ChargingStationListItem]
    func fetchChargingStationDetail(id: String) async throws -> ChargingStationDetail
}

final class ChargeFinderApiImpl: ChargeFinderApi {
    private let sharedApi = ChargeFinderBffImpl()
    
    func fetchChargingStationList() async throws -> [ChargingStationListItem] {
        try await sharedApi.fetchHome().map { ChargingStationListItem(sharedModel: $0) }
    }
    
    func fetchChargingStationDetail(id: String) async throws -> ChargingStationDetail {
        let detail = try await sharedApi.fetchDetail(id: id)
        return ChargingStationDetail(sharedModel: detail)
    }
}
