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

struct DuplicationEmailRequestDTO: Codable {
    
    var toDictionary: [String: Any] {
        let dict: [String: Any] = [
            "email": email
        ]
        return dict
    }
    
    let email: String
    
    init(duplicationEmail: DuplicationEmailQuery) {
        self.email = duplicationEmail.email
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





