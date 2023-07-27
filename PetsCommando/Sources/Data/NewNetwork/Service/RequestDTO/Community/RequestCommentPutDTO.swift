//
//  RequestCommentPutDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

struct RequestCommentPutDTO: Encodable {
    let dailyPostId: Int
    let content: String
    let commentId: Int
    
    enum CodingKeys: String, CodingKey {
        case dailyPostId, content, commentId
    }
}
