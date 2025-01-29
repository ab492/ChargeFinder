import SwiftUI

struct ChargingStationDetailView: View {
    @State private var viewModel: ChargingStationDetailViewModel
    
    init(viewModel: ChargingStationDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .loaded(let detail):
                ChargingStationDetailViewSuccess(
                    title: detail.title,
                    subtitle: detail.description,
                    images: detail.images
                )
            case .error(let error):
                ErrorView(
                    errorText: error,
                    action: {
                        Task {
                            await viewModel.fetch()
                        }
                    })
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.palette(.background))
        .task { await viewModel.fetch() }
    }
}

#Preview("Success State") {
    let mock = MockPreviewChargingStationDetailViewModel(state: .loaded(.mock))
    let mockImageCache = MockPreviewImageCache()
    return NavigationStack {
        ChargingStationDetailView(viewModel: mock)
            .environment(\.imageCache, mockImageCache)
    }
}
