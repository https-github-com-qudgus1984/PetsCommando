//
//  DailyPost.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

struct DailyPost: Hashable {
    let id: Int?
    let userId: Int?
    let title: String?
    let content: String?
    let likeNum: Int?
    let registerAt: Date?
    let updatedAt: Date?
}
