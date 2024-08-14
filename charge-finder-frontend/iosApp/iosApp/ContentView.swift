import SwiftUI
import shared

struct ContentView: View {
	let greet = Greeting().greet()
    let api = ChargeFinderBffAPI()

	var body: some View {
		Text(greet)
            .onAppear {
                api.fetchPages { page, error in
                    print(page?.first?.pageType.asPageTypeSwift)
                }
            }
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

enum PageTypeSwift {
    case list
    
    init?(pageType: PageType) {
        if pageType == PageType.list {
            self = .list
        } else {
            return nil
        }
    }
}

extension PageType {
    var asPageTypeSwift: PageTypeSwift? {
        PageTypeSwift(pageType: self)
    }
}
