//
//  ResponseDeletePostDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

struct ResponseDeletePostDTO: Decodable {
    let message: String?
    let dailyPostId: Int?
    
    enum CodingKeys: String, CodingKey {
        case message, dailyPostId
    }
}

extension ResponseDeletePostDTO {
    var toDomain: DeleteDailyPost {
        .init(message: message, dailyPostId: dailyPostId)
    }
}
