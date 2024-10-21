//
//  ChargingStationListView+ViewModel.swift
//  iosApp
//
//  Created by Andy Brown on 18/10/2024.
//  Copyright © 2024 orgName. All rights reserved.
//
import Foundation

import shared

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

extension ChargingStationListView {
    @Observable final class ViewModel {
        private(set) var state = State.loading
        private let api: ChargeFinderApi
        
        init(api: ChargeFinderApi) {
            self.api = api
        }
        
        func fetchChargingStations() async {
            do {
                let chargingStations = try await api.fetch()
                self.state = .loaded(chargingStations)
            } catch {
                self.state = .error("Something went wrong")
            }
            
        }
    }
}

enum State: Equatable {
    case loading
    case loaded([ChargingStationListItem])
    case error(String)
}
