import SwiftUI

struct ChargingStationListView: View {
    @State private var viewModel: ChargingStationListViewModel
    
    init(viewModel: ChargingStationListViewModel = ViewModel()) {
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
            .navigationDestination(for: ChargingStationListItem.self, destination: { station in
                ChargingStationDetailView(id: station.id)
            })
            .navigationTitle("Charging Stations")
        }
        .task { await viewModel.fetchChargingStations() }
    }
}


#Preview {
    let mock = MockPreviewChargingStationListViewModel(state: .loaded([.mock, .mock, .mock]))
    return ChargingStationListView(viewModel: mock)
}
