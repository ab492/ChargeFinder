import SwiftUI

struct ChargingStationListSuccess: View {
    let chargingStations: [ChargingStationListItem]
    
    var body: some View {
        List(chargingStations) { station in
            NavigationLink {
                Text("Detail Screen")
            } label: {
                Text(station.title)
            }
        }
        
    }
}

#Preview {
    ChargingStationListSuccess(chargingStations: [.mock, .mock, .mock])
}
