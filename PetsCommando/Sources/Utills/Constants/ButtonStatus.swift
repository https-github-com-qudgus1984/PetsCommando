//
//  ButtonStatus.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/03.
//

import UIKit

enum ButtonStatus: String {

    case inactive
    case fill
    case outline
    case cancel
    case disable

    var backgroundColor: UIColor {
        switch self {
        case .inactive:
            return .white
        case .fill:
            return .green
        case .outline:
            return .white
        case .cancel:
            return Color.BaseColor.gray2
        case .disable:
            return Color.BaseColor.gray6
        }
    }

    var titleColor: UIColor {
        switch self {
        case .inactive, .cancel:
            return .black
        case .fill, .disable:
            return .white
        case .outline:
            return .green
        }
    }

    var borderColor: CGColor {
        switch self {
        case .inactive:
            return Color.BaseColor.gray4.cgColor
        case .fill:
            return UIColor.green.cgColor
        case .outline:
            return UIColor.green.cgColor
        case .cancel:
            return Color.BaseColor.gray1.cgColor
        case .disable:
            return Color.BaseColor.gray6.cgColor
        }
    }
}
