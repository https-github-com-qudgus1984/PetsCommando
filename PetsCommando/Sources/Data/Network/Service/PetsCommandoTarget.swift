//
//  PetsCommandoTarget.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/27.
//

import Foundation
import Moya

typealias DictionaryType = [String: Any]


enum PetsCommandoTarget {
    //MARK: Auth
    case duplicationEmail(parameters: DictionaryType)
}

extension PetsCommandoTarget: TargetType {
    var task: Task {
        switch self {
        case .duplicationEmail(let parameters):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: APIKey.baseURL.description) else {
            fatalError("fatal error - invalid api url")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .duplicationEmail(_):
            return "/noauth/users/email-duplication"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .duplicationEmail:
            return .post
        }
    }
    
    var headers: [String: String]? {
//        let token = UserDefaults.standard.string(forKey: UserDefaultKeyCase.accessToken)!
        return [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
    }
    
}
