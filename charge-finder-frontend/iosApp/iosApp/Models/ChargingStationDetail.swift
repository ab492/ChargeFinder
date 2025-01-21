import Foundation
import shared

struct ChargingStationDetail: Equatable {
    let title: String
    let description: String
    let images: [URL]
    
    init(title: String, description: String, images: [URL]) {
        self.title = title
        self.description = description
        self.images = images
    }
    
    /// Initialiser for converting the KMP shared model to a local struct.
    init(sharedModel: shared.ChargingStationDetail) {
        self.title = sharedModel.title
        self.description = sharedModel.description_ // Note the underscore, since `description` clashes with the class description.
        self.images = sharedModel.images.compactMap { URL(string: $0) }
    }
}
