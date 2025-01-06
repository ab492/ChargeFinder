import SwiftUI

struct ChargingStationListView: View {
    @State var viewModel = ViewModel()
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading: Text("Loading...")
            case .loaded(let items):
                ForEach(items) { item in
                    Text(item.title)
                }
            case .error(let error):
                Text("ERROR: \(error)")
            }
        }
        .task { await viewModel.fetchChargingStations() }
    }
}
