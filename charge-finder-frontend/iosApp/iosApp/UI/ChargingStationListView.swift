import SwiftUI

struct ChargingStationListView: View {
    @State var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .loading: ProgressView()
                case .loaded(let items):
                    ChargingStationListSuccess(chargingStations: items) { station in
                        print("Station: \(station)")
                        viewModel.chargingStationTapped(station: station) }
                case .error(let error): ErrorView(
                    errorText: error,
                    action: {
                        Task {
                            await viewModel.fetchChargingStations()
                        }
                    })
                }
            }
            .navigationDestination(for: ViewModel.Destination.self) { destination in
                  switch destination {
                  case .detail:
                      Text("Hello")
                  }
              }
            .navigationTitle("Charging Stations")
        }
        .task { await viewModel.fetchChargingStations() }
    }
}
