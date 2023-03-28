//
//  TargetType.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/22.
//

//import Foundation
//
//protocol TargetType {
//    var host: String { get }
//    var path: String { get }
//    var header: [String: String] { get }
//    var queryItems: [URLQueryItem] { get }
//    var httpMethod: HTTPMethod { get }
//    var parameters: String? { get }
//}
//
//extension TargetType {
//    var components: URLComponents {
//        var components = URLComponents()
//        components.host = host
//        components.path = path
//        components.queryItems = queryItems
//        return components
//    }
//    var request: URLRequest {
//        guard let url = components.url else { fatalError() }
//        var request = URLRequest(url: url)
//        request.httpMethod = httpMethod.rawValue.uppercased()
//        request.allHTTPHeaderFields = header
//        request.httpBody = parameters?.data(using: .utf8)
//        return request
//    }
//}
//
