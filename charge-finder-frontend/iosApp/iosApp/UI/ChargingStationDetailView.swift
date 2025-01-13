import SwiftUI

struct ChargingStationDetailView: View {
    @State var viewModel = ViewModel()
    
    var body: some View {
        Text(viewModel.text)
    }
}

#Preview {
    ChargingStationDetailView()
}

extension ChargingStationDetailView {
    @Observable
    class ViewModel {
        let text = "Charging Station Detail"
    }
}
