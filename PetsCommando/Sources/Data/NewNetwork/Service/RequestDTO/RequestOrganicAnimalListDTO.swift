//
//  RequestOrganicAnimalListDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/20.
//

import Foundation

struct RequestOrganicAnimalListDTO: Codable {
    let sido: String
    let sigungu: String
    
    enum CodingKeys: String, CodingKey {
        case sido
        case sigungu
    }
}
