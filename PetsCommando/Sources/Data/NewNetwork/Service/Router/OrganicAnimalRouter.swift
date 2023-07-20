//
//  OrganicAnimalRouter.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/20.
//

import Foundation

enum OrganicAnimalRouter<R> {
    case organicAnimal(parameters: OrganicAnimalListQuery)
}

extension OrganicAnimalRouter: NewTargetType {
 
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
        case .organicAnimal:
            return "/noauth/abandoned-animal-list/sido-sigungu"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .organicAnimal(let parameters):
            return [URLQueryItem(name: "sido", value: parameters.sido), URLQueryItem(name: "sigungu", value: parameters.sigungu)]
        }
    }
    
    var parameters: String? {
        return nil
    }
    
    var header: [String : String] {
        switch self {
        case .organicAnimal:
            return ["accept" : "application/json" , "Content-Type": "application/json"]
        }
    }
    
    var body: Data? {
        switch self {
        case .organicAnimal:
            return nil
        }
    }
    
    var httpMethod: NewHTTPMethod {
        switch self {
        case .organicAnimal:
            return .get
        }
    }
}
