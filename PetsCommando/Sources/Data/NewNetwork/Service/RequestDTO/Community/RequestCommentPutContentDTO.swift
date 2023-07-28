//
//  RequestCommentPutContentDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/28.
//

import Foundation

struct RequestCommentPutContentDTO: Encodable {
    let content: String
    
    enum CodingKeys: String, CodingKey {
        case content
    }
}
