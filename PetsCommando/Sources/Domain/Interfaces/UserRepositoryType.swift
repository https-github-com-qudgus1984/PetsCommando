//
//  AuthRepositoryType.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/22.
//

import Foundation

protocol UserRepositoryType: AnyObject {
    
    func fetchEmail() -> String?
    
    func fetchNickname() -> String?

    func saveEmailInfo(email: String)
    
    func saveNicknameInfo(nickname: String)

}
