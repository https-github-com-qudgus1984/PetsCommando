//
//  DetailDailyPost.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

struct DetailDailyPost: Hashable {
    let dailyPostId: Int?
    let userId: Int?
    let nickName: String?
    let title: String?
    let content: String?
    let likecount: Int?
    let commentcount: Int?
    let registerAt: Date?
    let updatedAt: Date?
}
