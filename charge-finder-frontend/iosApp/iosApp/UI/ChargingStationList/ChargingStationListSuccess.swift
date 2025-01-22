import SwiftUI

struct ChargingStationListSuccess: View {
    let chargingStations: [ChargingStationListItem]
    
    var body: some View {
        List(chargingStations) { station in
            NavigationLink(value: station) {
                ChargingStationListViewItem(
                    title: station.title,
                    subtitle: station.details
                )
                
            }
            .listRowSeparatorTint(Color.palette(.secondary))
            .listRowBackground(Color.palette(.background))
        }
        .listStyle(.plain)
    }
}

#Preview {
    ChargingStationListSuccess(
        chargingStations: [.mock, .mock, .mock]
    )
}
