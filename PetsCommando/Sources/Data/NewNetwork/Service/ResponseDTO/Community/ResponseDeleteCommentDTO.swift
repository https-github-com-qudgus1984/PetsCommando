//
//  ResponseDeleteCommentDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/28.
//

import Foundation

struct ResponseDeleteCommentDTO: Decodable {
    let message: String
    let commentId: Int
    
    enum CodingKeys: String, CodingKey {
        case message, commentId
    }
}

extension ResponseDeleteCommentDTO {
    var toDomain: CommentDelete {
        .init(message: message, commentId: commentId)
    }
}
