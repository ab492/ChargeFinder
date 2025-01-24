import Foundation
import shared

struct ChargingStationListItem: Equatable, Identifiable, Hashable {
    let id: String
    let title: String
    let details: String
    
    init(id: String, title: String, details: String) {
        self.id = id
        self.title = title
        self.details = details
    }
    
    /// Initialiser for converting the KMP shared model to a local struct.
    init(sharedModel: shared.ChargingStationListItem) {
        self.id = sharedModel.id
        self.title = sharedModel.title
        self.details = sharedModel.details
    }
}
