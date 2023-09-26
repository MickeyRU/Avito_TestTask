//
//  URLRequest+Extension.swift
//  ImageFeed
//
//  Created by Павел Афанасьев on 02.05.2023.
//

import Foundation

extension URLRequest {
    static func makeHTTPRequest(uRLString: String) -> URLRequest? {
        guard let url = URL(string: uRLString) else { return nil }
        return URLRequest(url: url)
    }
}
