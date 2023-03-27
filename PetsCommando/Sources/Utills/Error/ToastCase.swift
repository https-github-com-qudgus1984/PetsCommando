//
//  ToastCase.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/27.
//

import Foundation

enum ToastCase {

    case duplicationEmail
}

extension ToastCase {
    var description: String {
        switch self {
        case .duplicationEmail:
            return "중복된 이메일입니다."
        }
    }
}
