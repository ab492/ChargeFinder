import UIKit

protocol ImageCacheProtocol {
    func set(image: UIImage, forKey key: URL)
    func value(forKey key: URL) -> UIImage?
}
