//
//  RequestSigunguListDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/20.
//

import Foundation

struct RequestSigunguListDTO: Codable {
    let sidoName: String
    
    enum CodingKeys: String, CodingKey {
        case sidoName
    }
}
