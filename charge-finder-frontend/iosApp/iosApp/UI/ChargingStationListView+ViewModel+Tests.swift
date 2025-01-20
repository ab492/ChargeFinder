import Testing
@testable import iosApp

@MainActor
struct ChargingStationListViewModelTests {
    
    private let mockApi: MockChargeFinderApi
    private let sut: ChargingStationListView.ViewModel
    
    init() {
        self.mockApi = MockChargeFinderApi()
        self.sut = ChargingStationListView.ViewModel(api: mockApi)
    }

    @Test func initialState_isLoading() {
        #expect(sut.state == .loading)
    }
    
    @Test func fetchChargingStations_callsApi() async {
        await sut.fetchChargingStations()
        
        #expect(mockApi.fetchCallCount == 1)
    }
    
    @Test func givenApiReturnsStations_stateIsUpdatedToLoaded() async {
        mockApi.resultToReturn = .success([.init(id: "123", title: "Dummy Title")])
        
        await sut.fetchChargingStations()
        
        #expect(sut.state == .loaded([.init(id: "123", title: "Dummy Title")]))
    }
    
    @Test func givenApiThrowsAnError_stateIsUpdatedToError() async {
        mockApi.resultToReturn = .failure(TestError.dummyError)
        
        await sut.fetchChargingStations()
        
        #expect(sut.state == .error("Something went wrong"))
    }
}

final private class MockChargeFinderApi: ChargeFinderApi {
    var fetchCallCount = 0
    var resultToReturn: Result<[ChargingStationListItem], Error>?

    func fetchChargingStationList() async throws -> [ChargingStationListItem] {
        fetchCallCount += 1
        if let resultToReturn {
            switch resultToReturn {
            case .success(let chargingStations):
                return chargingStations
            case .failure(let error):
                throw error
            }
        } else {
            return []
        }
    }
    
    func fetchChargingStationDetail(id: String) async throws -> iosApp.ChargingStationDetail {
        fatalError("Not implemented")
    }
}

private enum TestError: Error {
    case dummyError
}
