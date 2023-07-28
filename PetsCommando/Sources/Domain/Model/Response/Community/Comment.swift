//
//  Comment.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

struct Comment: Hashable {
    let id: Int?
    let userId: Int?
    let dailyPostId: Int?
    let content: String?
    let nickname: String?
    let registerAt: String?
    let updatedAt: String?
}
