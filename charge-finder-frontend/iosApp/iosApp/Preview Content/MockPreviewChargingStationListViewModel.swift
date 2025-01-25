import Foundation

final class MockPreviewChargingStationListViewModel: ChargingStationListViewModel {
    
    init(state: PageState<[ChargingStationListItem]>) {
        self.state = state
    }
    
    var state: PageState<[ChargingStationListItem]>
    func fetchChargingStations() async {}
}
