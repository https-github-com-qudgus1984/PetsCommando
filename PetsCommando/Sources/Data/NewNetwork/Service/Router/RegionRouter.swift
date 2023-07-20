//
//  RegionRouter.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/20.
//

import Foundation

enum RegionRouter<R> {
    case sido
    case sigungu(parameters: SigunguListQuery)
}

extension RegionRouter: NewTargetType {
 
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
        case .sido:
            return "/noauth/sido-list"
        case .sigungu:
            return "/noauth/sigungu-list"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .sigungu(let parameters):
            return [URLQueryItem(name: "sidoName", value: parameters.sidoName)]
        default:
            return nil
        }
    }
    
    var parameters: String? {
        return nil
    }
    
    var header: [String : String] {
        switch self {
        case .sido, .sigungu:
            return ["accept" : "application/json" , "Content-Type": "application/json"]
        }
    }
    
    var body: Data? {
        switch self {
        case .sido:
            return nil
        case .sigungu(let parameters):
            let requestDTO = RequestSigunguListDTO(sidoName: parameters.sidoName)
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = .convertToSnakeCase
            return try? encoder.encode(requestDTO)
        }
    }
    
    var httpMethod: NewHTTPMethod {
        switch self {
        case .sido, .sigungu:
            return .get
        }
    }
}
