//
//  DuplicationEmailResponseDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/28.
//

import Foundation

struct DuplicationEmailResponseDTO: Codable {

    private enum CodingKeys: String, CodingKey {
        case email = "email"
        case message = "message"
        case timestamp = "timestamp"

    }

    let email: String
    let message: String?
    let timestamp: String
}

extension DuplicationEmailResponseDTO {

    func toDomain() -> DuplicationEmail {
        return .init(
            email: email,
            message: message ?? "",
            timestamp: timestamp
        )
    }
}
