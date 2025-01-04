import SwiftUI

struct ChargingStationListView: View {
    private let viewModel = ViewModel()
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading: Text("Loading...")
            case .loaded(let chargingStations): Text("Charging station count: \(chargingStations.count)")
            case .error(let error): Text("ERROR: \(error)")
            }
        }
        .task { await viewModel.fetchChargingStations() }
    }
}


#Preview {
    ChargingStationListView()
}
