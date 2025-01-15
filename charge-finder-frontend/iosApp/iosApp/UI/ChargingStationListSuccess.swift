import SwiftUI

struct ChargingStationListSuccess: View {
    let chargingStations: [ChargingStationListItem]
    
    var body: some View {
        List(chargingStations) { station in
            NavigationLink(value: station) {
                Text(station.title)
                
            }
        }
    }
}

#Preview {
    ChargingStationListSuccess(
        chargingStations: [.mock, .mock, .mock]
    )
}
