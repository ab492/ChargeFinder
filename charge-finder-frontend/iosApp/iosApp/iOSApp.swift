import SwiftUI

extension EnvironmentValues {
    @Entry var imageCache: ImageCacheProtocol = RemoteImageView.ImageCache.shared
}

@main
struct iOSApp: App {
	var body: some Scene {
		WindowGroup {
            ChargingStationListView()
		}
	}
}
