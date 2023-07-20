//
//  ResponseSigunguListDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/20.
//

import Foundation

struct ResponseSigunguListDTO: Codable {
    let totalCount: Int
    let sidoName: String
    let sigunguList: [String]
    
    enum CodingKeys: String, CodingKey {
        case totalCount, sidoName, sigunguList
    }
}

extension ResponseSigunguListDTO {
    var toDomain: SigunguList {
        return .init(totalCount: totalCount, sidoName: sidoName, sigunguList: sigunguList)
    }
}
