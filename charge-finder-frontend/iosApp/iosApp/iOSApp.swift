import SwiftUI

@main
struct iOSApp: App {
    @Environment(\.api) var api

	var body: some Scene {
		WindowGroup {
            ChargingStationListView(
                viewModel: ChargingStationListView.ViewModel(api: api)
            )
		}
	}
}
