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
    var text: String {
        switch self {
        case .inputID:
            return "이메일을 입력해주세요."
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
    case auth
}

extension AuthString {
    var text: String {
        switch self {
        case .id:
            return "이메일"
        case .pw:
            return "비밀번호"
        case .login:
            return "로그인"
        case .signup:
            return "회원가입"
        case .auth:
            return "인증"
        }
    }
}

enum ValidationString {
    case successAuth
    case duplicateInspection
    case samePW
    case notSamePW
}

extension ValidationString {
    var text: String {
        switch self {
        case .successAuth:
            return "인증이 완료되었습니다."
        case .duplicateInspection:
            return "이메일 중복 검사가 필요합니다."
        case .samePW:
            return "비밀번호가 일치합니다."
        case .notSamePW:
            return "비밀번호가 일치하지 않습니다."
        }
    }
}
