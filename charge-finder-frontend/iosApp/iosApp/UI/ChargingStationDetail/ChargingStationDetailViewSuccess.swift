import SwiftUI

struct ChargingStationDetailViewSuccess: View {
    let title: String
    let subtitle: String
    let images: [URL]
    
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: 3)
    @State private var isEditing = false

    private var columnsTitle: String {
        gridColumns.count > 1 ? "\(gridColumns.count) Columns" : "1 Column"
    }
    
    var body: some View {
        VStack {
            if isEditing {
                ColumnStepper(title: columnsTitle, range: 1...4, columns: $gridColumns)
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
                imageGrid(items: images.map { .init(url: $0) })
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
    
    private func imageGrid(items: [ChargingStationDetailViewSuccess.Item]) -> some View {
        VStack {
            LazyVGrid(columns: gridColumns) {
                ForEach(items) { item in
                    GeometryReader { geo in
                        GridItemView(url: item.url, size: geo.size)
                    }
                    .cornerRadius(8.0)
                    .aspectRatio(1, contentMode: .fit)
                }
            }.padding()
        }
    }
}

extension ChargingStationDetailViewSuccess {
    struct Item: Identifiable, Equatable {
        let url: URL
        var id: String { url.absoluteString }
    }
}




struct GridItemView: View {
    let url: URL
    let size: CGSize
    
    var body: some View {
        RemoteImageView(url: url)
            .scaledToFill()
            .frame(width: size.width, height: size.height)
    }
}

struct ColumnStepper: View {

    @Binding private var columns: [GridItem]
    @State private var numberOfColumns: Int
    private let title: String
    private let range: ClosedRange<Int>
    
    init(title: String,
         range: ClosedRange<Int>,
         columns: Binding<[GridItem]>) {
        self.title = title
        self.range = range
        self._columns = columns
        self.numberOfColumns = columns.count
    }
    
    var body: some View {
        Stepper(title, value: $numberOfColumns, in: range, step: 1) { _ in
            withAnimation {
                columns = Array(repeating: GridItem(.flexible()), count: numberOfColumns)
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

