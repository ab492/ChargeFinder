import SwiftUI

struct ChargingStationListView: View {
    @Environment(\.api) var api
    @State private var viewModel: ChargingStationListViewModel
    
    init(viewModel: ChargingStationListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .loading:
                    ProgressView()
                case .loaded(let items):
                    ChargingStationListSuccess(chargingStations: items)
                case .error(let error):
                    ErrorView(
                        errorText: error,
                        action: {
                            Task {
                                await viewModel.fetchChargingStations()
                            }
                        })
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Charging Stations ⚡️")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.palette(.background))
            .navigationDestination(
                for: ChargingStationListItem.self,
                destination: { station in
                    ChargingStationDetailView(
                        viewModel: ChargingStationDetailView.ViewModel(
                            id: station.id,
                            api: api
                        )
                    )
            })
            .navigationTitle("Charging Stations")
        }
        .task { await viewModel.fetchChargingStations() }
    }
}

// MARK: - Previews

#Preview("Success State") {
    let mock = MockPreviewChargingStationListViewModel(state: .loaded([.mock, .mock, .mock]))
    return ChargingStationListView(viewModel: mock)
}

#Preview("Loading State") {
    let mock = MockPreviewChargingStationListViewModel(state: .loading)
    return ChargingStationListView(viewModel: mock)
}

#Preview("Error State") {
    let mock = MockPreviewChargingStationListViewModel(state: .error("Something went wrong"))
    return ChargingStationListView(viewModel: mock)
}

