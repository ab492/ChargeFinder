//
//  ChargingStationListViewModelTestss.swift
//  iosAppTests
//
//  Created by Andy Brown on 18/10/2024.
//  Copyright © 2024 orgName. All rights reserved.
//

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
    
    @Test func initialDestinationIsNil() {
        #expect(sut.destination == nil)
    }
    
    @Test func selectingChargingStationItem_updatesDestination() {
        let item = ChargingStationListItem(id: "123", title: "Dummy Title")
        
        sut.chargingStationTapped(station: item)
        
        #expect(sut.destination == .detail)
    }
}

final private class MockChargeFinderApi: ChargeFinderApi {
    var fetchCallCount = 0
    var resultToReturn: Result<[ChargingStationListItem], Error>?

    func fetch() async throws -> [ChargingStationListItem] {
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
}

private enum TestError: Error {
    case dummyError
}
