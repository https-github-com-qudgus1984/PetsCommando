//
//  RequestDailyPostDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

struct RequestDailyPostDTO: Encodable {
    let title: String
    let content: String
    let photo: String
    
    enum CodingKeys: String, CodingKey {
        case title, content,  photo
    }
}
