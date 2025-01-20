import SwiftUI

struct ChargingStationDetailView: View {
    @State var viewModel = ViewModel(id: "1")
    
    var body: some View {
        Text(viewModel.text)
    }
}

#Preview {
    ChargingStationDetailView()
}

