//
//  Font.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/04.
//

import UIKit

struct Font {
    static let Title1_B20 = UIFont(name: FontEnum.Gangwon_Bold.text, size: 20)
    static let Title2_B16 = UIFont(name: FontEnum.Gangwon_Bold.text, size: 16)
    static let Title3_B12 = UIFont(name: FontEnum.Gangwon_Bold.text, size: 12)
    static let Body1_L20 = UIFont(name: FontEnum.Gangwon_Light.text, size: 20)
    static let Body2_L16 = UIFont(name: FontEnum.Gangwon_Light.text, size: 16)
    static let Body3_L12 = UIFont(name: FontEnum.Gangwon_Light.text, size: 12)
}
//
//enum Font {
//    case Display1_R20
//    case Title1_M16
//    case Title2_R16
//    case Title3_M14
//    case Title4_R14
//    case Title5_M12
//    case Title6_R12
//    case Body1_M16
//    case Body2_R16
//    case Body3_R14
//    case Body4_R12
//    case caption_R10
//    
//    var fontType: String {
//        switch self {
//        case .Display1_R20, .Title2_R16, .Title4_R14, .Title6_R12, .Body2_R16, .Body3_R14, .Body4_R12, .caption_R10:
//            return "GangwonEduAll-OTFLight"
//        case .Title1_M16, .Title3_M14, .Title5_M12, .Body1_M16:
//            return "GangwonEduAll-OTFBold"
//        }
//    }
//    
//    var fontSize: CGFloat {
//        switch self {
//        case .Display1_R20:
//            return 20
//        case .Title2_R16, .Body2_R16, .Title1_M16, .Body1_M16:
//            return 16
//        case .Title4_R14, .Body3_R14, .Title3_M14:
//            return 14
//        case .Title6_R12, .Body4_R12, .Title5_M12:
//            return 12
//        case .caption_R10:
//            return 10
//        }
//    }
//    
//    var lineHeightRate: CGFloat {
//        switch self {
//        case .Display1_R20, .Title1_M16, .Title2_R16, .Title3_M14, .Title4_R14:
//            return 160
//        case .Title5_M12, .Title6_R12:
//            return 150
//        case .Body1_M16, .Body2_R16:
//            return 185
//        case .Body3_R14:
//            return 170
//        case .Body4_R12:
//            return 180
//        case .caption_R10:
//            return 160
//        }
//    }
//    
//}
