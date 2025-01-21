import SwiftUI

struct ChargingStationDetailView: View {
    @State private var viewModel: ViewModel
    
    init(id: String) {
        self._viewModel = State(wrappedValue: ViewModel(id: id))
    }
    
    var body: some View {
        VStack {
            Text(viewModel.text)
        }
    }
}

#Preview {
    ChargingStationDetailView(id: "1")
}

