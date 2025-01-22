import SwiftUI

struct ChargingStationDetailViewSuccess: View {
    let title: String
    let subtitle: String
    let images: [URL]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.title)
                    .foregroundColor(.palette(.text))
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.palette(.secondary))
            }
            .frame(maxWidth: .infinity, alignment: .leading) // TODO: ‼️ Check this
            .padding(.horizontal)
            ProgressView()
        }
    }
}
