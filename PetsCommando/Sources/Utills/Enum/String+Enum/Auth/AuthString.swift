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
    case inputNickname
}

extension AuthPlaceHolder {
    var text: String {
        switch self {
        case .inputID:
            return "이메일을 입력해주세요."
        case .inputPW:
            return "비밀번호를 입력해주세요."
        case .inputNickname:
            return "닉네임을 입력해주세요."
        }
    }
}

enum AuthString {
    case id
    case pw
    case login
    case signup
    case auth
    case nickname
    case next
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
        case .nickname:
            return "닉네임"
        case .next:
            return "다음"
        }
    }
}

enum ValidationString {
    case successAuth
    case duplicateInspectionEmail
    case samePW
    case notSamePW
    case duplicateInspectionNickname
    case passwordFormat
    case passwordFormatSuccess
}

extension ValidationString {
    var text: String {
        switch self {
        case .successAuth:
            return "인증이 완료되었습니다."
        case .duplicateInspectionEmail:
            return "이메일 중복 검사가 필요합니다."
        case .samePW:
            return "비밀번호가 일치합니다."
        case .notSamePW:
            return "비밀번호가 일치하지 않습니다."
        case .duplicateInspectionNickname:
            return "닉네임 중복 검사가 필요합니다."
        case .passwordFormat:
            return "숫자, 대소문자, 특수문자 포함 총 8글자 이상"
        case .passwordFormatSuccess:
            return "사용할 수 있는 비밀번호입니다."
        }
    }
}
