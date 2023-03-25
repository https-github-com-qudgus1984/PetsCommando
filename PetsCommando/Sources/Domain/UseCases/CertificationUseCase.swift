//
//  AuthUseCase.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/22.
//

import Foundation
import RxSwift

final class CertificationUseCase {
    private let userRepository: UserRepositoryType
    private let petCommandoRepository: PetsCommandoRepositoryType
    
    private let userDefaults = UserDefaults.standard
    
    init(
        userRepository: UserRepositoryType,
        petCommandoRepository: PetsCommandoRepositoryType
    ) {
        self.userRepository = userRepository
        self.petCommandoRepository = petCommandoRepository
    }
    
    func excuteEmail(email: String) {
        self.petCommandoRepository.requestDuplicationEmail(email: email) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let email):
                self.userDefaults.set(email, forKey: UserDefaultKeyCase.email)
            case .failure(let error):
                print(error)
            }
        }
    }
    
//    func excuteNickname(nickname: String) {
//        self.petCommandoRepository.requestDuplicationNickname(nickname: nickname) { <#Result<String, NetworkError>#> in
//            <#code#>
//        }
//    }
    
    
}

