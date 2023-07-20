//
//  RegisterResponseDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/15.
//

import Foundation

struct RegisterResponseDTO: Codable {

    private enum CodingKeys: String, CodingKey {
        case email = "email"
        case message = "message"
        case timestamp = "timestamp"
        case password = "password"

    }

    let email: String?
    let message: String?
    let timestamp: String?
    let password: String?
}

extension RegisterResponseDTO {

    func toDomain() -> Register {
        return .init(
            email: email ?? "",
            message: message ?? "",
            timestamp: timestamp ?? "",
            password: password ?? ""
        )
    }
}
