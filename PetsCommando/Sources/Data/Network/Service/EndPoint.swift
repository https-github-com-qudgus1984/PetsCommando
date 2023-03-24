//
//  EndPoint.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/22.
//

import Foundation

enum EndPoint {
    case email
    case nickname
    case register
    case login
}

extension EndPoint {
    var url: String {
        switch self {
        case .email:
            return "/noauth/users/email-duplication"
        case .login:
            return "/login"
        case .nickname:
            return "/noauth/users/nickname-duplication"
        case .register:
            return "/noauth/users/register"
        }
    }
}


