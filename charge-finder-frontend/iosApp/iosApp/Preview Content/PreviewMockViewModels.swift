import Foundation

final class MockPreviewChargingStationListViewModel: ChargingStationListViewModel {
    
    init(state: PageState<[ChargingStationListItem]>) {
        self.state = state
    }
    
    var state: PageState<[ChargingStationListItem]>
    func fetchChargingStations() async {}
}

final class MockPreviewChargingStationDetailViewModel: ChargingStationDetailViewModel {
    
    init(state: PageState<ChargingStationDetail>) {
        self.state = state
    }
    
    var state: PageState<ChargingStationDetail>
    func fetch() async { }
}
