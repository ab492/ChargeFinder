import UIKit
@testable import iosApp

final class MockImageCache: ImageCacheProtocol {
    func set(image: UIImage, forKey key: URL) {
        fatalError("Not implemented")
    }
    
    var imageToReturn: UIImage?
    func value(forKey key: URL) -> UIImage? {
        imageToReturn
    }
}
