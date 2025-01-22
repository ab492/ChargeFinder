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

/// A image view loaded from a URL. This view handles network fetching and caching.
struct RemoteImageView: View {
    
    @StateObject private var loader: Loader
    
    init(url: URL) {
        _loader = StateObject(wrappedValue: Loader(url: url))
    }
    
    var body: some View {
        ZStack {
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
        }.onAppear { loader.load() }
    }
}

// MARK: - Loader

extension RemoteImageView {
    private enum LoadState {
        case loading
        case success(UIImage)
        case failure
    }
    
    private final class Loader: ObservableObject {
        
        private let cache = ImageCache.shared
        private let url: URL
        private(set) var state = LoadState.loading
        
        init(url: URL) {
            self.url = url
        }
        
        func load() {
            if let cachedImage = loadImageFromCache(for: url) {
                state = .success(cachedImage)
                objectWillChange.send()
                return
            }
            
            URLSession.shared.dataTask(with: self.url) { [weak self] data, response, error in
                guard let self else { return }
                
                if let data = data,
                   let image = UIImage(data: data) {
                    self.addImageToCache(image, for: self.url)
                    self.state = .success(image)
                } else {
                    self.state = .failure
                }
                DispatchQueue.main.async {
                    self.objectWillChange.send()
                }
            }.resume()
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

