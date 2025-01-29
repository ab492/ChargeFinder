import SwiftUI

/// A image view loaded from a URL. This view handles network fetching and caching.
struct RemoteImageView: View {
    
    @State private var loader: Loader
    
    init(url: URL, imageCache: ImageCacheProtocol) {
        _loader = State(wrappedValue: Loader(url: url, imageCache: imageCache))
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
    enum LoadState {
        case loading
        case success(UIImage)
        case failure
    }
    
    @Observable final class Loader {
        
        // MARK: - Properties

        private let url: URL
        private(set) var state = LoadState.loading
        private let urlSession: URLSessionProtocol
        private let imageCache: ImageCacheProtocol
        
        // MARK: - Init

        init(
            url: URL,
            urlSession: URLSessionProtocol,
            imageCache: ImageCacheProtocol
        ) {
            self.url = url
            self.urlSession = urlSession
            self.imageCache = imageCache
        }
        
        convenience init(
            url: URL,
            imageCache: ImageCacheProtocol
        ) {
            self.init(
                url: url,
                urlSession: URLSession.shared,
                imageCache: imageCache
            )
        }
        
        // MARK: - Public

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
        
        // MARK: - Private
        
        private func addImageToCache(_ image: UIImage, for url: URL) {
            imageCache.set(image: image, forKey: url)
        }
        
        private func loadImageFromCache(for url: URL) -> UIImage? {
            imageCache.value(forKey: url)
        }
    }
}
