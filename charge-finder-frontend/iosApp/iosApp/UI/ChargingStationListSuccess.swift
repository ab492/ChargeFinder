import SwiftUI

struct ChargingStationListSuccess: View {
    let chargingStations: [ChargingStationListItem]
    let onChargingStationSelected: (ChargingStationListItem) -> Void
    
    var body: some View {
        List(chargingStations) { station in
            Button {
                onChargingStationSelected(station)
            } label: {
                Text(station.title)
            }
        }
    }
}

#Preview {
    ChargingStationListSuccess(
        chargingStations: [.mock, .mock, .mock],
        onChargingStationSelected: { _ in 
        })
}
