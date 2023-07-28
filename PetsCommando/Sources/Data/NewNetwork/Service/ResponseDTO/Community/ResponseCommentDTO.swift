//
//  ResponseCommentDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

struct ResponseCommentDTO: Decodable {
    let id: Int?
    let userId: Int?
    let dailyPostId: Int?
    let content: String?
    let nickname: String?
    let registerAt: String?
    let updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id, userId, dailyPostId, content, nickname, registerAt, updatedAt
    }
}

extension ResponseCommentDTO {
    var toDomain: Comment {
        .init(id: id, userId: userId, dailyPostId: dailyPostId, content: content, nickname: nickname, registerAt: registerAt, updatedAt: updatedAt)
    }
}
