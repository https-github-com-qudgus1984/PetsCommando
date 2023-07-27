//
//  TotalDailyPostList.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

struct ThumbnailDailyPost: Hashable {
    let dailyPostId: Int?
    let userId: Int?
    let nickName: String?
    let title: String?
    let registerAt: Date?
    let updatedAt: Date?
    let likecount: Int?
    let commentcount: Int?
}
