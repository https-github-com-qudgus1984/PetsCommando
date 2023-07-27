//
//  CommentPutQuery.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

struct CommentPutQuery: Hashable {
    let dailyPostId: Int
    let content: String
    let commentId: Int
}
