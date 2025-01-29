import SwiftUI

extension EnvironmentValues {
    @Entry var imageCache: ImageCacheProtocol = ImageCache.shared
    @Entry var api: ChargeFinderApi = ChargeFinderApiImpl()
}

