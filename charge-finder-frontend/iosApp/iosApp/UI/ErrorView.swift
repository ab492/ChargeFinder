import SwiftUI

struct ErrorView: View {
    let errorText: String
    let action: () -> Void
    
    var body: some View {
        VStack {
            Text(errorText)
            Button("Try again") { action() }
        }
    }
}

#Preview {
    ErrorView(
        errorText: "An error occurred",
        action: { }
    )
}
