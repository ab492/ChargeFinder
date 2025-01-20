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
    
    @Test func givenApiReturnsDetail_stateIsUpdatedToLoaded() async {
        mock.fetchChargingStationDetailIdStringChargingStationDetailReturnValue = .init(title: "Some Test Title", description: "Some Test Description")
        let sut = ChargingStationDetailView.ViewModel(id: "dummy", api: mock)

        await sut.fetch()
        
        #expect(sut.state == .loaded(.init(title: "Some Test Title", description: "Some Test Description")))
    }
    
    @Test func givenApiThrowsAnError_stateIsUpdatedToError() async {
        mock.fetchChargingStationDetailIdStringChargingStationDetailThrowableError = TestError.dummyError
        let sut = ChargingStationDetailView.ViewModel(id: "dummy", api: mock)
        
        await sut.fetch()
        
        #expect(sut.state == .error("Something went wrong"))
    }
}
