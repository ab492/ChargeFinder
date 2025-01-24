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

extension ChargingStationListSuccess {
    struct ChargingStationListViewItem: View {
        let title: String
        let subtitle: String
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.palette(.text))
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.palette(.secondary))
            }
        }
    }
}

#Preview {
    ChargingStationListSuccess(
        chargingStations: [.mock, .mock, .mock]
    )
}
