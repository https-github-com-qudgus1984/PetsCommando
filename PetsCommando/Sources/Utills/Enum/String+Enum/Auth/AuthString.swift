//
//  AuthString.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/06.
//

import Foundation

enum AuthPlaceHolder {
    case inputID
    case inputPW
}

extension AuthPlaceHolder {
    var text: String? {
        switch self {
        case .inputID:
            return "id를 입력해주세요."
        case .inputPW:
            return "비밀번호를 입력해주세요."
        }
    }
}

enum AuthString {
    case id
    case pw
    case login
    case signup
}

extension AuthString {
    var text: String? {
        switch self {
        case .id:
            return "아이디"
        case .pw:
            return "비밀번호"
        case .login:
            return "로그인"
        case .signup:
            return "회원가입"
        }
    }
}
