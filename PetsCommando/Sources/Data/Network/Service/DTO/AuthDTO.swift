//
//  AuthDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/22.
//

import Foundation

struct authDTO: Codable {
    let nickname: String
    let email: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case nickname, email, password
    }
}

extension authDTO {
    var toDomain: authDTO {
        return .init(nickname: nickname, email: email, password: password)
    }
}

struct emailDTO: Codable {
    let email: String
    let message: String
    let timestamp: String
    
    enum CodingKeys: String, CodingKey {
        case email
        case message
        case timestamp
    }
}

extension emailDTO {
    var toDomain: emailDTO {
        return .init(email: email, message: message, timestamp: timestamp)
    }
}

struct nicknameDTO: Codable {
    let nickname: String
    
    enum CodingKeys: String, CodingKey {
        case nickname
    }
}


extension nicknameDTO {
    var toDomain: nicknameDTO {
        return .init(nickname: nickname)
    }
}

struct loginDTO: Codable {
    let email: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case email, password
    }
}


extension loginDTO {
    var toDomain: loginDTO {
        return .init(email: email, password: password)
    }
}





