import Foundation

extension ChargingStationListView {
    @Observable final class ViewModel {
        private(set) var state = State.loading
        private let api: ChargeFinderApi
        
        init(api: ChargeFinderApi) {
            self.api = api
        }
        
        func fetchChargingStations() async {
            do {
                let chargingStations = try await api.fetch()
                self.state = .loaded(chargingStations)
            } catch {
                self.state = .error("Something went wrong")
            }
            
        }
    }
}

enum State: Equatable {
    case loading
    case loaded([ChargingStationListItem])
    case error(String)
}
