//
//  RequestUpdateDailyPostDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

struct RequestUpdateDailyPostDTO: Encodable {
    let title: String
    let content: String
    let dailyPostId: Int
    
    enum CodingKeys: String, CodingKey {
        case title, content, dailyPostId
    }
}
