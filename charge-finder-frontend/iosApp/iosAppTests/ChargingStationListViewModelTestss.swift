//
//  ChargingStationListViewModelTestss.swift
//  iosAppTests
//
//  Created by Andy Brown on 18/10/2024.
//  Copyright © 2024 orgName. All rights reserved.
//

import Testing
@testable import iosApp

struct ChargingStationListViewModelTestss {
    
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
    
    @Test func givenApiReturnsStations_stateIsUpdated() async {
        mockApi.stationsToReturn = [.init(id: "123", title: "Dummy Title")]
        
        await sut.fetchChargingStations()
        
        #expect(sut.state == .loaded([.init(id: "123", title: "Dummy Title")]))
    }
    
    

}

final private class MockChargeFinderApi: ChargeFinderApi {
    
    var fetchCallCount = 0
    var stationsToReturn: [ChargingStationListItem]? // TODO: Make CHARGEFINDERAPI RETURN RESULT TYPE

    func fetch() async throws -> [ChargingStationListItem] {
        fetchCallCount += 1
        return stationsToReturn ?? []
    }
    
    
}
