//
//  DuplicationNicknameResponseDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/15.
//

import Foundation

struct DuplicationNicknameResponseDTO: Codable {

    private enum CodingKeys: String, CodingKey {
        case nickname = "nickname"
        case message = "message"
        case timestamp = "timestamp"

    }

    let nickname: String
    let message: String?
    let timestamp: String
}

extension DuplicationNicknameResponseDTO {

    func toDomain() -> DuplicationNickname {
        return .init(
            nickname: nickname,
            message: message ?? "",
            timestamp: timestamp
        )
    }
}
