//
//  UpdateDailyPostQuery.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

struct UpdateDailyPostQuery: Hashable {
    let title: String
    let content: String
    let dailyPostId: Int
}
