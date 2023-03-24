//
//  UserRepositor.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/22.
//

import Foundation
import RxSwift

final class UserRepository: UserRepositoryType {
    func fetchEmail() -> String? {
        return UserDefaults.standard.string(forKey: UserDefaultKeyCase.email)
    }
    
    func fetchNickname() -> String? {
        return UserDefaults.standard.string(forKey: UserDefaultKeyCase.nickname)
    }
    
    func saveEmailInfo(email: String) {
        UserDefaults.standard.set(email, forKey: UserDefaultKeyCase.email)
    }
    
    func saveNicknameInfo(nickname: String) {
        UserDefaults.standard.set(nickname, forKey: UserDefaultKeyCase.nickname)
    }
}
