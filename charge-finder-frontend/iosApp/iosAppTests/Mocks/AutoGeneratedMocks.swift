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


@testable import Charge_Finder
























class ChargeFinderApiMock: ChargeFinderApi {




    //MARK: - fetchChargingStationList

    var fetchChargingStationListChargingStationListItemThrowableError: (any Error)?
    var fetchChargingStationListChargingStationListItemCallsCount = 0
    var fetchChargingStationListChargingStationListItemCalled: Bool {
        return fetchChargingStationListChargingStationListItemCallsCount > 0
    }
    var fetchChargingStationListChargingStationListItemReturnValue: [ChargingStationListItem]!
    var fetchChargingStationListChargingStationListItemClosure: (() async throws -> [ChargingStationListItem])?

    func fetchChargingStationList() async throws -> [ChargingStationListItem] {
        fetchChargingStationListChargingStationListItemCallsCount += 1
        if let error = fetchChargingStationListChargingStationListItemThrowableError {
            throw error
        }
        if let fetchChargingStationListChargingStationListItemClosure = fetchChargingStationListChargingStationListItemClosure {
            return try await fetchChargingStationListChargingStationListItemClosure()
        } else {
            return fetchChargingStationListChargingStationListItemReturnValue
        }
    }

    //MARK: - fetchChargingStationDetail

    var fetchChargingStationDetailIdStringChargingStationDetailThrowableError: (any Error)?
    var fetchChargingStationDetailIdStringChargingStationDetailCallsCount = 0
    var fetchChargingStationDetailIdStringChargingStationDetailCalled: Bool {
        return fetchChargingStationDetailIdStringChargingStationDetailCallsCount > 0
    }
    var fetchChargingStationDetailIdStringChargingStationDetailReceivedId: (String)?
    var fetchChargingStationDetailIdStringChargingStationDetailReceivedInvocations: [(String)] = []
    var fetchChargingStationDetailIdStringChargingStationDetailReturnValue: ChargingStationDetail!
    var fetchChargingStationDetailIdStringChargingStationDetailClosure: ((String) async throws -> ChargingStationDetail)?

    func fetchChargingStationDetail(id: String) async throws -> ChargingStationDetail {
        fetchChargingStationDetailIdStringChargingStationDetailCallsCount += 1
        fetchChargingStationDetailIdStringChargingStationDetailReceivedId = id
        fetchChargingStationDetailIdStringChargingStationDetailReceivedInvocations.append(id)
        if let error = fetchChargingStationDetailIdStringChargingStationDetailThrowableError {
            throw error
        }
        if let fetchChargingStationDetailIdStringChargingStationDetailClosure = fetchChargingStationDetailIdStringChargingStationDetailClosure {
            return try await fetchChargingStationDetailIdStringChargingStationDetailClosure(id)
        } else {
            return fetchChargingStationDetailIdStringChargingStationDetailReturnValue
        }
    }


}
