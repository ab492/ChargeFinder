import Foundation
import Observation

protocol ChargingStationListViewModel{
    var state: PageState<[ChargingStationListItem]> { get }
    func fetchChargingStations() async
}

extension ChargingStationListView {
    @Observable
    final class ViewModel: ChargingStationListViewModel {

        // MARK: - Properties

        private(set) var state: PageState<[ChargingStationListItem]> = .loading
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
                let chargingStations = try await api.fetchChargingStationList()
                self.state = .loaded(chargingStations)
            } catch {
                self.state = .error("Something went wrong")
            }
        }
    }
}
