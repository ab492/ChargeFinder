import SwiftUI
import shared

struct ContentView: View {
	let greet = Greeting().greet()
    let api = ChargeFinderBffAPI()

	var body: some View {
		Text(greet)
            .onAppear {
                api.fetchHome { items, error in
                    print("ITEMS: \(items)")
                }
            }
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
