//
//  TabBarPageCases.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/21.
//

import Foundation

enum TabBarPageCase: String, CaseIterable {
    case home, search, community

    init?(index: Int) {
        switch index {
        case 0: self = .home
        case 1: self = .search
        case 2: self = .community
        default: return nil
        }
    }

    var pageOrderNumber: Int {
        switch self {
        case .home: return 0
        case .search: return 1
        case .community: return 2
        }
    }

    var pageTitle: String {
        switch self {
        case .home:
            return "홈"
        case .search:
            return "검색"
        case .community:
            return "내정보"
        }
    }

    func tabIconName() -> String {
        switch self {
        case .home:
            return "house"
        case .search:
            return "magnifyingglass"
        case .community:
            return "person"
        }
    }
}
