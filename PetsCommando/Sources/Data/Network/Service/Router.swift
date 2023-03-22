//
//  Router.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/02/06.
//

import Foundation

enum UnsplashRouter {
    case auth
}

extension UnsplashRouter: TargetType {
    var scheme: String {
        return "https"
    }

    var host: String {
        return "api.unsplash.com"
    }

    var path: String {
        switch self {
        case .auth: return "/noauth"
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .auth:
            return [URLQueryItem(name: "order_by", value: "featured")]
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        default:
            return .post
        }
    }

    var header: [String: String] {
        switch self {
        default:
            return ["Accept-Version": "v1",
                    "Authorization": "Client-ID \(APIKey.ipAdress)"]
        }
    }

    var parameters: String? {
        return nil
    }
}
