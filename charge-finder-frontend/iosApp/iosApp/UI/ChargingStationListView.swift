import SwiftUI

struct ChargingStationListView: View {
    @State var viewModel = ViewModel()
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading: ProgressView()
            case .loaded(let items):
                ChargingStationListSuccess(chargingStations: items)
            case .error(let error): ErrorView(
                errorText: error,
                action: {
                    Task {
                        await viewModel.fetchChargingStations()
                    }
                })
            }
        }
        .task { await viewModel.fetchChargingStations() }
    }
}
