//
//  Cummunity.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/18.
//

import UIKit

enum Community:Int, CaseIterable {
    case community = 1, list
    
    var title: String {
        switch self {
        case .community: return "커뮤니티"
        case .list: return "유기 동물 리스트"
        }
    }
    
}
