import Testing
import shared
@testable import Charge_Finder

struct ChargingStationDetailTests {
    @Test func descriptionFieldIsCorrectlyMappedFromSharedModelToLocalModel() async throws {
        let model = shared.ChargingStationDetail(title: "Dummy title", description: "Dummy description", images: [])
        
        let sut = ChargingStationDetail(sharedModel: model)
        
        #expect(sut.description == "Dummy description")
    }
}
