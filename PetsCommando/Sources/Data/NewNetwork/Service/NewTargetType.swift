//
//  TargetType.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/20.
//

import Foundation

protocol NewTargetType {
    associatedtype Response
    
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var httpMethod: NewHTTPMethod { get }
    var queryItems: [URLQueryItem]? { get }
    var header: [String: String] { get }
    var parameters: String? { get }
    var port: Int { get }
    var body: Data? { get }
}

extension NewTargetType {
    var components: URLComponents {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        components.port = port
        return components
    }
    
    var request: URLRequest {
        guard let url = components.url else { fatalError("URL ERRROR") }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = header
        request.httpBody = parameters?.data(using: .utf8)
        request.httpBody = body
        return request
    }
}
