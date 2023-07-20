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
    case duplicationEmail(parameters: DuplicationEmailQuery)
    case duplicationNickname(parameters: DuplicationNicknameQuery)
    case register(parameter: RegisterQuery)
    case login(parameter: LoginQuery)
}

extension PetsCommandoTarget: TargetType {
    var task: Task {
        switch self {
        case .duplicationEmail(let parameters):
            return .requestJSONEncodable(parameters)
        case .duplicationNickname(let parameters):
            return .requestJSONEncodable(parameters)
        case .register(parameter: let parameters):
            return .requestJSONEncodable(parameters)
        case .login(let parameters):
            return .requestJSONEncodable(parameters)
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: APIKey.baseURL) else {
            fatalError("fatal error - invalid api url")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .duplicationEmail(_):
            return "/noauth/users/email-duplication"
        case .duplicationNickname(_):
            return "/noauth/users/nickname-duplication"
        case .register(_):
            return "/noauth/users/register"
        case .login(_):
            return "/login"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .duplicationEmail, .duplicationNickname, .register, .login:
            return .post
        }
    }
    
    var headers: [String: String]? {
//        let token = UserDefaults.standard.string(forKey: UserDefaultKeyCase.accessToken)!
        switch self {
        case .duplicationEmail, .duplicationNickname, .register, .login:
            return ["Content-Type": "application/json"]
        }
    }
}
