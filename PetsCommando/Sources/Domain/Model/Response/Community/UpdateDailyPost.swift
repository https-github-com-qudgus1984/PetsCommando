//
//  EditDailyPost.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

struct UpdateDailyPost: Hashable {
    let id: Int?
    let userId: Int?
    let title: String?
    let content: String?
    let updatedAt: String?
}
