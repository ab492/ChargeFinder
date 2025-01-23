import Foundation
@testable import iosApp

final class MockURLSession: URLSessionProtocol {
    var dataCallCount = 0
    func data(from url: URL) async throws -> (Data, URLResponse) {
        dataCallCount += 1
        
        let data = Data()
        let response = URLResponse(
            url: url,
            mimeType: "application/json",
            expectedContentLength: data.count,
            textEncodingName: nil
        )
        
        return (data, response)
    }
}
