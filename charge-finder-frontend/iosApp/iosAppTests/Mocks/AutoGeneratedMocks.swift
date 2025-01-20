// Generated using Sourcery 2.2.5 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif


@testable import iosApp
























class ChargeFinderApiMock: ChargeFinderApi {




    //MARK: - fetch

    var fetchChargingStationListItemThrowableError: (any Error)?
    var fetchChargingStationListItemCallsCount = 0
    var fetchChargingStationListItemCalled: Bool {
        return fetchChargingStationListItemCallsCount > 0
    }
    var fetchChargingStationListItemReturnValue: [ChargingStationListItem]!
    var fetchChargingStationListItemClosure: (() async throws -> [ChargingStationListItem])?

    func fetchChargingStationList() async throws -> [ChargingStationListItem] {
        fetchChargingStationListItemCallsCount += 1
        if let error = fetchChargingStationListItemThrowableError {
            throw error
        }
        if let fetchChargingStationListItemClosure = fetchChargingStationListItemClosure {
            return try await fetchChargingStationListItemClosure()
        } else {
            return fetchChargingStationListItemReturnValue
        }
    }


}
