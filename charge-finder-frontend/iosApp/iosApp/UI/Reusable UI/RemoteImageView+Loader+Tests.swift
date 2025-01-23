import Testing
import UIKit
@testable import iosApp

struct RemoteImageView_Loader_Tests {
    
    private let mockUrlSession: MockURLSession
    private let mockImageCache: MockImageCache
    private let sut: RemoteImageView.Loader
    
    init() {
        self.mockUrlSession = MockURLSession()
        self.mockImageCache = MockImageCache()
        self.sut = RemoteImageView.Loader(
            url: URL(string: "www.dummy-image-url.com")!,
            urlSession: mockUrlSession,
            imageCache: mockImageCache
        )
    }

    @Test func ifImageExistsInCache_noNetworkRequestIsMade() async throws {
        mockImageCache.imageToReturn = createTestImage()
        
        await sut.load()
        
        #expect(mockUrlSession.dataCallCount == 0)
    }
    
    private func createTestImage(
        color: UIColor = .red
    ) -> UIImage {
        let size = CGSize(width: 100, height: 100)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer { UIGraphicsEndImageContext() }

        color.setFill()
        UIRectFill(CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
}
