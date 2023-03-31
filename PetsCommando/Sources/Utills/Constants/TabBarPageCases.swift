//
//  TabBarPageCases.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/21.
//

import Foundation

enum TabBarPageCase: String, CaseIterable {
    case home, search, book, community

    init?(index: Int) {
        switch index {
        case 0: self = .home
        case 1: self = .search
        case 2: self = .book
        case 3: self = .community
        default: return nil
        }
    }

    var pageOrderNumber: Int {
        switch self {
        case .home: return 0
        case .search: return 1
        case .book: return 2
        case .community: return 3
        }
    }

    var pageTitle: String {
        switch self {
        case .home:
            return "홈"
        case .search:
            return "검색"
        case .book:
            return "백화사전"
        case .community:
            return "커뮤니티"
        }
    }

    func tabIconName() -> String {
        switch self {
        case .home:
            return "house"
        case .search:
            return "magnifyingglass"
        case .book:
            return "book"
        case .community:
            return "pencil.tip.crop.circle"
        }
    }
}
