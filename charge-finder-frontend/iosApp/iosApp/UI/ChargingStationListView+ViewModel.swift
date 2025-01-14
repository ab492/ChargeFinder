import Foundation
import Observation

extension ChargingStationListView {
    @Observable @MainActor
    final class ViewModel {
        
        // MARK: - Types

        enum State: Equatable {
            case loading
            case loaded([ChargingStationListItem])
            case error(String)
        }
        
        enum Destination {
            case detail
        }
        
        // MARK: - Properties

        private(set) var state = State.loading
        private(set) var destination: Destination?
        private let api: ChargeFinderApi
        
        // MARK: - Init

        init(api: ChargeFinderApi) {
            self.api = api
            self.destination = nil
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
        
        func chargingStationTapped(station: ChargingStationListItem) {
            self.destination = .detail
        }
    }
}
