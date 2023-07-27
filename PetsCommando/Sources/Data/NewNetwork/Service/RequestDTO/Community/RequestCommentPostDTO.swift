//
//  RequestCommentPostDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

struct RequestCommentPostDTO: Encodable {
    let dailyPostId: Int
    let content: String
    
    enum CodingKeys: String, CodingKey {
        case dailyPostId, content
    }
}
