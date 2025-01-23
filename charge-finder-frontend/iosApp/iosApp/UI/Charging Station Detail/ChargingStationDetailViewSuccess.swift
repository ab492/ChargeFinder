import SwiftUI

struct ChargingStationDetailViewSuccess: View {
    
    // MARK: - Properties

    let title: String
    let subtitle: String
    let images: [URL]
    
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: 3)
    @State private var isEditing = false

    private var columnStepperTitle: String {
        gridColumns.count > 1 ? "\(gridColumns.count) Columns" : "1 Column"
    }
    
    // MARK: - Body

    var body: some View {
        VStack {
            if isEditing {
                ColumnStepper(title: columnStepperTitle, range: 1...4, columns: $gridColumns)
                    .padding(.horizontal)
            }
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
                DynamicImageGrid(gridColumns: $gridColumns, images: images)
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(isEditing ? "Done" : "Edit") {
                    withAnimation { isEditing.toggle() }
                }
            }
        }
    }
}



