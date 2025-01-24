import shared

// sourcery: AutoMockable
protocol ChargeFinderApi {
    func fetchChargingStationList() async throws -> [ChargingStationListItem]
    func fetchChargingStationDetail(id: String) async throws -> ChargingStationDetail
}

final class ChargeFinderApiImpl: ChargeFinderApi {
    private let sharedApi = ChargeFinderBffImpl()
    
    func fetchChargingStationList() async throws -> [ChargingStationListItem] {
        do {
            return try await sharedApi.fetchHome().map { ChargingStationListItem(sharedModel: $0) }
        } catch {
            throw error
        }
    }
    
    func fetchChargingStationDetail(id: String) async throws -> ChargingStationDetail {
        do {
            let detail = try await sharedApi.fetchDetail(id: id)
            return ChargingStationDetail(sharedModel: detail)
        } catch {
            throw error
        }
    }
}
