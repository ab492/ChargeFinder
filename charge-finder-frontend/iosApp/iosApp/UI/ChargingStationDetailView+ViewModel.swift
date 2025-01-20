import Observation

extension ChargingStationDetailView {
    @Observable
    class ViewModel {
        enum State {
            case loading
        }
        let state = State.loading
        
        let text = "Charging Station Detail"
    }
}
