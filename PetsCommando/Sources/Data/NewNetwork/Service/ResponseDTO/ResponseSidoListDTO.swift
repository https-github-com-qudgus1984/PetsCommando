//
//  ResponseSidoListDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/20.
//

import Foundation

struct ResponseSidoListDTO: Codable {
    let totalCount: Int
    let sidoList: [String]
    
    enum CodingKeys: String, CodingKey {
        case totalCount, sidoList
    }
}

extension ResponseSidoListDTO {
    var toDomain: SidoList {
        return .init(totalCount: totalCount, sidoList: sidoList)
    }
}
