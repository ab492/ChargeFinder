import Observation

extension ChargingStationDetailView {
    @Observable
    class ViewModel {
        enum State {
            case loading
        }
        
        private let api: ChargeFinderApi
        private let id: String

        
        // MARK: - Init

        init(id: String, api: ChargeFinderApi) {
            self.api = api
            self.id = id
        }
        
        convenience init(id: String) {
            self.init(id: id, api: ChargeFinderApiImpl())
        }
        
        let state = State.loading
        
        let text = "Charging Station Detail"
        
        func fetch() async {
            try? await api.fetchChargingStationDetail(id: id)
        }
    }
}
