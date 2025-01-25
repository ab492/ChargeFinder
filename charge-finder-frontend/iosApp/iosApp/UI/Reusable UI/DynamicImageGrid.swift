import SwiftUI

/// An adjustable grid of remote images. Once loaded, the images will be cached.
struct DynamicImageGrid: View {
    @Binding var gridColumns: [GridItem]
    let images: [URL]
    
    var body: some View {
        LazyVGrid(columns: gridColumns) {
            ForEach(images, id: \.self) { url in
                GeometryReader { geo in
                    GridItemView(url: url, size: geo.size)
                }
                .cornerRadius(8.0)
                .aspectRatio(1, contentMode: .fit)
            }
        }.padding()
    }
}

private struct GridItemView: View {
    let url: URL
    let size: CGSize
    @Environment(\.imageCache) var imageCache
    
    var body: some View {
        RemoteImageView(url: url, imageCache: imageCache)
            .scaledToFill()
            .frame(width: size.width, height: size.height)
    }
}
