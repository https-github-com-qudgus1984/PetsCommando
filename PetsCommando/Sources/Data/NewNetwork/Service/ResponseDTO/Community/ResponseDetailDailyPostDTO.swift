//
//  ResponseDetailDailyPostDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

struct ResponseDetailDailyPostDTO: Decodable {
    let dailyPostId: Int?
    let userId: Int?
    let nickName: String?
    let title: String?
    let content: String?
    let likecount: Int?
    let commentcount: Int?
    let registerAt: String?
    let updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case dailyPostId, userId, nickName, title, content, likecount, commentcount, registerAt, updatedAt
    }
}

extension ResponseDetailDailyPostDTO {
    var toDomain: DetailDailyPost {
        .init(dailyPostId: dailyPostId, userId: userId, nickName: nickName, title: title, content: content, likecount: likecount, commentcount: commentcount, registerAt: registerAt, updatedAt: updatedAt)
    }
}
