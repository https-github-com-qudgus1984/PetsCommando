//
//  ResponseDailyPostDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

struct ResponseDailyPostDTO: Decodable {
    let id: Int?
    let userId: Int?
    let title: String?
    let content: String?
    let likeNum: Int?
    let registerAt: String?
    let updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id, userId, title, content, likeNum, registerAt, updatedAt
    }
}

extension ResponseDailyPostDTO {
    var toDomain: DailyPost {
        .init(id: id, userId: userId, title: title, content: content, likeNum: likeNum, registerAt: registerAt, updatedAt: updatedAt)
    }
}
