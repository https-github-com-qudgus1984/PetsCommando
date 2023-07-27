//
//  ResponseThumbnailDailyPostDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

struct ResponseThumbnailDailyPostDTO: Decodable {
    let dailyPostId: Int?
    let userId: Int?
    let nickName: String?
    let title: String?
    let registerAt: Date?
    let updatedAt: Date?
    let likecount: Int?
    let commentcount: Int?
    
    enum CodingKeys: String, CodingKey {
        case dailyPostId, userId, nickName, title, registerAt, updatedAt, likecount, commentcount
    }
}

extension ResponseThumbnailDailyPostDTO {
    var toDomain: ThumbnailDailyPost {
        .init(dailyPostId: dailyPostId, userId: userId, nickName: nickName, title: title, registerAt: registerAt, updatedAt: updatedAt, likecount: likecount, commentcount: commentcount)
    }
}
