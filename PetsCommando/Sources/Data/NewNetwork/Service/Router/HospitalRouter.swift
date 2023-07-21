//
//  HospitalRouter.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/21.
//

import Foundation

enum HospitalRouter<R> {
    case hospital
}

extension HospitalRouter: NewTargetType {
 
    typealias Response = R
    
    var port: Int {
        return 9090
    }
    
    var scheme: String {
        return "http"
    }
    
    var host: String {
        return APIKey.newURL
    }
    
    var path: String {
        switch self {
        case .hospital:
            return "/noauth/openapi/hospital"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .hospital:
            return nil
        }
    }
    
    var parameters: String? {
        return nil
    }
    
    var header: [String : String] {
        switch self {
        case .hospital:
            return ["accept" : "application/json" , "Content-Type": "application/json"]
        }
    }
    
    var body: Data? {
        switch self {
        case .hospital:
            return nil
        }
    }
    
    var httpMethod: NewHTTPMethod {
        switch self {
        case .hospital:
            return .get
        }
    }
}
