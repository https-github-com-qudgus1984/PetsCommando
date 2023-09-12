//
//  DailyPostQuery.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

struct DailyPostQuery: Encodable {
    let title: String
    let content: String
    let photo: String
}

struct DTO: Encodable {
    let title: String
    let content: String
}
