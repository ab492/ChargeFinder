import UIKit

final class ImageCache: ImageCacheProtocol {
    static let shared = ImageCache()
    
    private init() { }
    
    private let cache = KeyValueCache<URL, UIImage>()
    
    func set(image: UIImage, forKey key: URL) {
        cache.set(value: image, forKey: key)
    }
    
    func value(forKey key: URL) -> UIImage? {
        cache.value(forKey: key)
    }
}
