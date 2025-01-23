import SwiftUI

/// A image view loaded from a URL. This view handles network fetching and caching.
struct RemoteImageView: View {
    
    @State private var loader: Loader
    
    init(url: URL) {
        _loader = State(wrappedValue: Loader(url: url))
    }
    
    var body: some View {
        Group {
            switch loader.state {
            case .success(let image):
                Image(uiImage: image)
                    .resizable()
            case .failure:
                Image(systemName: "multiply.circle")
                    .resizable()
            case .loading:
                ProgressView()
            }
        }.task { await loader.load() }
    }
}

// MARK: - Loader

extension RemoteImageView {
    fileprivate enum LoadState {
        case loading
        case success(UIImage)
        case failure
    }
    
    @Observable
    fileprivate final class Loader {
        
        private let cache = ImageCache.shared
        private let url: URL
        private(set) var state = LoadState.loading
        private let urlSession: URLSessionProtocol
        
        init(url: URL, urlSession: URLSessionProtocol) {
            self.url = url
            self.urlSession = urlSession
        }
        
        convenience init(url: URL) {
            self.init(url: url, urlSession: URLSession.shared)
        }
        
        func load() async {
            if let cachedImage = loadImageFromCache(for: url) {
                state = .success(cachedImage)
                return
            }
            
            do {
                let (data, _) = try await urlSession.data(from: url)
                
                if let image = UIImage(data: data) {
                    addImageToCache(image, for: url)
                    state = .success(image)
                } else {
                    state = .failure
                }
            } catch {
                state = .failure
            }
        }
        
        private func addImageToCache(_ image: UIImage, for url: URL) {
            cache.set(image: image, forKey: url)
        }
        
        private func loadImageFromCache(for url: URL) -> UIImage? {
            cache.value(forKey: url)
        }
    }
}

// MARK: - Cache

extension RemoteImageView {
    private final class ImageCache {
        static let shared = ImageCache()

        private init() { }

        private let cache = KeyValueCache<URL, UIImage>()

        func set(image: UIImage, forKey key: URL) {
            cache.set(value: image, forKey: key)
        }

        func value(forKey key: URL) -> UIImage? {
            cache.value(forKey: key)
        }
    }
}


protocol URLSessionProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol { }
