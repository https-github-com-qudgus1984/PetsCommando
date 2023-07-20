//
//  LoginResponseDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/15.
//

import Foundation

struct LoginResponseDTO: Codable {

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case accessToken = "accessToken"
        case email = "email"
        case nickname = "nickname"
        case message = "message"
        case timestamp = "timestamp"

    }

    let id: Int?
    let accessToken: String?
    let email: String?
    let nickname: String?
    let message: String?
    let timestamp: String?
}

extension LoginResponseDTO {

    func toDomain() -> Login {
        return .init(
            id: id ?? 0,
            accessToken: accessToken ?? "",
            email: email ?? "",
            nickname: nickname ?? "",
            message: message ?? "",
            timestamp: timestamp ?? ""
        )
    }
}
