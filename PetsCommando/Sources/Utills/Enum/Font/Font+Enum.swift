//
//  String.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/06.
//

import Foundation

enum FontEnum {
    case Gangwon_Light
    case Gangwon_Bold
}

extension FontEnum {
    var text: String {
        switch self {
        case .Gangwon_Bold:
            return "GangwonEduAll-OTFBold"
        case .Gangwon_Light:
            return "GangwonEduAll-OTFLight"
        }
    }
}
