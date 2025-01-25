import UIKit

final class MockPreviewChargingStationListViewModel: ChargingStationListViewModel {
    
    init(state: PageState<[ChargingStationListItem]>) {
        self.state = state
    }
    
    var state: PageState<[ChargingStationListItem]>
    func fetchChargingStations() async {}
}

final class MockPreviewChargingStationDetailViewModel: ChargingStationDetailViewModel {
    
    init(state: PageState<ChargingStationDetail>) {
        self.state = state
    }
    
    var state: PageState<ChargingStationDetail>
    func fetch() async { }
}

final class MockPreviewImageCache: ImageCacheProtocol {
    
    var imagesToReturn: [UIImage] = [
        UIImage(imageLiteralResourceName: "preview-01"),
        UIImage(imageLiteralResourceName: "preview-02"),
        UIImage(imageLiteralResourceName: "preview-03"),
        UIImage(imageLiteralResourceName: "preview-04")
    ]
    
    func set(image: UIImage, forKey key: URL) { }
    
    func value(forKey key: URL) -> UIImage? {
        imagesToReturn.randomElement()
    }
}
