import SwiftUI

/// A view for adjusting the number of columns in a grid layout interactively. It
/// takes a title, a range of allowed column counts and a binding to your grid
/// layout. Layout changes are animated.
struct ColumnStepper: View {

    @Binding private var columns: [GridItem]
    private let title: String
    private let range: ClosedRange<Int>
    
    init(
        title: String,
        range: ClosedRange<Int>,
        columns: Binding<[GridItem]>
    ) {
        self.title = title
        self.range = range
        self._columns = columns
    }
    
    var body: some View {
        Stepper(title, value: Binding(
            get: { columns.count },
            set: { newValue in
                withAnimation {
                    columns = Array(repeating: GridItem(.flexible()), count: newValue)
                }
            }
        ), in: range)
    }
}
