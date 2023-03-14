//
//  HomeString.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/14.
//

import UIKit

enum HomeString {
    case community
}

extension HomeString {
    var text: String {
        switch self {
        case .community:
            return "커뮤니티에 새 글을 작성하고 \n 잃어버린 반려동물을 찾아보세요"
        }
    }
}

