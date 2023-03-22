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

enum SectionWeek:Int, CaseIterable {
    case week1 = 1, week2, week3, week4, week5, week6, week7
    
    var title: String {
        switch self {
        case .week1:
            return "1주차"
        case .week2:
            return "2주차"
        case .week3:
            return "3주차"
        case .week4:
            return "4주차"
        case .week5:
            return "5주차"
        case .week6:
            return "6주차"
        case .week7:
            return "7주차"
        }
    }
}
