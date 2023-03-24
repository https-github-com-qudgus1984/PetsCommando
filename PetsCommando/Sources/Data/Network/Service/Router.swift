//
//  Router.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/02/06.
//

import Foundation

enum Router {
    case email
    case register
    case nickname
    case login
}

extension Router: TargetType {
    
    var scheme: String {
        return "https"
    }

    var host: String {
        return APIKey.ipAdress + ":" + APIKey.portNumber
    }

    var path: String {
        switch self {
        case .email: return EndPoint.email.url
        case .register: return EndPoint.register.url
        case .nickname: return EndPoint.nickname.url
        case .login: return EndPoint.login.url
        }
    }

    
    var queryItems: [URLQueryItem] {
        switch self {
        default:
            return [URLQueryItem(name: "order_by", value: "featured")]
        }
    }
     
    var httpMethod: HTTPMethod {
        switch self {
        case .email, .login, .nickname, .register:
            return .post

        }
    }

    var header: [String: String] {
        switch self {
        default:
            return ["Authorization": "Client-ID \(APIKey.ipAdress)"]
        }
    }

    var parameters: String? {
        return nil
    }
}
