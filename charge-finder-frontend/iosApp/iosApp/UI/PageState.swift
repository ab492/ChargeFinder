import Foundation

enum PageState<T>: Equatable where T: Equatable {
    case loading
    case loaded(T)
    case error(String)
}
