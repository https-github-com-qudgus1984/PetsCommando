//
//  RequestCommentDeleteDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

struct RequestCommentDeleteDTO: Encodable {
    let commentId: Int
    
    enum CodingKeys: String, CodingKey {
        case commentId
    }
}
