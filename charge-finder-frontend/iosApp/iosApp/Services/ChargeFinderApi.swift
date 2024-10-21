//
//  ChargeFinderApi.swift
//  iosApp
//
//  Created by Andy Brown on 21/10/2024.
//  Copyright © 2024 orgName. All rights reserved.
//
import shared

// sourcery: AutoMockable
protocol ChargeFinderApi {
    func fetch() async throws -> [ChargingStationListItem]
    
}

final class ChargeFinderApiImpl: ChargeFinderApi {
    private let sharedApi = ChargeFinderBffImpl()
    
    func fetch() async throws -> [ChargingStationListItem] {
        try await sharedApi.fetchHome().map {
            ChargingStationListItem(id: $0.id, title: $0.title)
        }
    }
}
