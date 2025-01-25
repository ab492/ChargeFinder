import Observation

protocol ChargingStationDetailViewModel{
    var state: PageState<ChargingStationDetail> { get }
    func fetch() async
}

extension ChargingStationDetailView {
    @Observable
    class ViewModel: ChargingStationDetailViewModel {
        
        // MARK: - Properties
        
        private let api: ChargeFinderApi
        private let id: String
        private(set) var state = PageState<ChargingStationDetail>.loading
        
        // MARK: - Init

        init(id: String, api: ChargeFinderApi) {
            self.api = api
            self.id = id
        }
        
        convenience init(id: String) {
            self.init(id: id, api: ChargeFinderApiImpl())
        }
        
        // MARK: - Public
        
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
