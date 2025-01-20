import Observation



extension ChargingStationDetailView {
    @Observable
    class ViewModel {
 
        
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
        
        var state = PageState<ChargingStationDetail>.loading
        
        let text = "Charging Station Detail"
        
        func fetch() async {
            do {
                let detailModel = try await api.fetchChargingStationDetail(id: id)
                self.state = .loaded(detailModel)
            } catch {
                self.state = .error("Something went wrong")
            }
        }
    }
}
