import SwiftUI
import shared

struct ContentView: View {
	let greet = Greeting().greet()
    let api = ChargeFinderBffImpl()

	var body: some View {
        ChargingStationListView()
//		Text(greet)
//            .onAppear {
//                api.fetchHome { items, error in
//                    print("ITEMS:\(items)")
//                }
//                
////                api.fetchList(href: "home") { items, error in
////                    print("ITEMS:\(items)")
////                }
////                
////                api.fetchDetail(href: "chargingStationDetail/2") { detail, error in
////                    print("DETAIL: \(detail?.description_)")
////                }
//            }
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
