//
//  ChargingStationDetailViewModelTests.swift
//  iosAppTests
//
//  Created by Andy Brown on 20/01/2025.
//  Copyright © 2025 orgName. All rights reserved.
//

import Testing
@testable import iosApp

struct ChargingStationDetailViewModelTests {
    let mock: ChargeFinderApiMock
    
    init() {
        self.mock = ChargeFinderApiMock()
        self.mock.fetchChargingStationDetailIdStringChargingStationDetailReturnValue = .init(title: "Dummy Title", description: "Dummy Description")
        
    }
    
    @Test func initialStateIsLoading() async throws {
        
        let sut = ChargingStationDetailView.ViewModel(id: "dummy", api: mock)
        
        #expect(sut.state == .loading)
        
    }
    
    @Test func fetchDetail_callsTheApi() async throws {
        let sut = ChargingStationDetailView.ViewModel(id: "dummy", api: mock)

        await sut.fetch()
        
        #expect(mock.fetchChargingStationDetailIdStringChargingStationDetailCallsCount == 1)
    }

}
