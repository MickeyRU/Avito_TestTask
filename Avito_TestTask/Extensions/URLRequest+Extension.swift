import Foundation

extension URLRequest {
    static func makeHTTPRequest(uRLString: String) -> URLRequest? {
        guard let url = URL(string: uRLString) else { return nil }
        return URLRequest(url: url)
    }
}
