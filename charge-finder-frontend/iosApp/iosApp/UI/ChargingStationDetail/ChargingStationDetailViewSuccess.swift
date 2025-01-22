import SwiftUI

struct ChargingStationDetailViewSuccess: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.title)
                .foregroundColor(.palette(.text))
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.palette(.secondary))
        }.padding(.horizontal)
    }
}

#Preview {
    ChargingStationDetailViewSuccess(title: "Title", subtitle: "Descriptions")
}
