//
//  ResponseUpdateDailyPostDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

struct ResponseUpdateDailyPostDTO: Decodable {
    let id: Int?
    let userId: Int?
    let title: String?
    let content: String?
    let updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id, userId, title, content, updatedAt
    }
}

extension ResponseUpdateDailyPostDTO {
    var toDomain: UpdateDailyPost {
        .init(id: id, userId: userId, title: title, content: content, updatedAt: updatedAt)
    }
}
