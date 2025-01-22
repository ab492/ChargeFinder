import SwiftUI

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

#Preview {
    ChargingStationListViewItem(
        title: "Title",
        subtitle: "Subtitle"
    )
}


