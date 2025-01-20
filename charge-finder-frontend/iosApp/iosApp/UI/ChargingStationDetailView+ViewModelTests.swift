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

    @Test func test() async throws {
        let mock = ChargeFinderApiMock()
        let sut = ChargingStationDetailView.ViewModel()
        
        #expect(sut.state == .loading)
        
    }

}
