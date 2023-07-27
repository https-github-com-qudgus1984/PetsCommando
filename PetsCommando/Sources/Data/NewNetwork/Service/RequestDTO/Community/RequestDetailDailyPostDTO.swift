//
//  RequestDetailDailyPostDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

struct RequestDetailDailyPostDTO: Encodable {
    let dailyPostId: Int
    
    enum CodingKeys: String, CodingKey {
        case dailyPostId
    }
}
