import Foundation
import Observation

@MainActor
protocol ChargingStationListViewModel {
    var state: ChargingStationListView.ViewModel.State { get }
    func fetchChargingStations() async
}

extension ChargingStationListView {
    @Observable @MainActor
    final class ViewModel: ChargingStationListViewModel {
        
        // MARK: - Types

        enum State: Equatable {
            case loading
            case loaded([ChargingStationListItem])
            case error(String)
        }
        
        // MARK: - Properties

        private(set) var state = State.loading
        private let api: ChargeFinderApi
        
        // MARK: - Init

        init(api: ChargeFinderApi) {
            self.api = api
        }
        
        convenience init() {
            self.init(api: ChargeFinderApiImpl())
        }
        
        // MARK: - Public Methods
        
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
