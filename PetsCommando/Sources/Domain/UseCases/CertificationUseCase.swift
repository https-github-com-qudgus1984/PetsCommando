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
    
    var successDuplicationEmail = PublishSubject<Int>()
    var successDuplicationNickname = PublishSubject<Int>()
    var successRegister = PublishSubject<Int>()
    var successLogin = PublishSubject<Int>()

    
    init(
        userRepository: UserRepositoryType,
        petCommandoRepository: PetsCommandoRepositoryType
    ) {
        self.userRepository = userRepository
        self.petCommandoRepository = petCommandoRepository
    }
    
    func excuteEmail(email: String) {
        let emailQuery = DuplicationEmailQuery(email: email)
        self.petCommandoRepository.requestDuplicationEmail(emailQuery: emailQuery) { [weak self] response in
            
            guard let self = self else { return }
            switch response {
            case .success(let statusCode):
                self.successDuplicationEmail.onNext(statusCode)
            case .failure(let error):
                print(error.errorDescription)
            }
        }
    }
    
    func excuteNickname(nickname: String) {
        let nicknameQuery = DuplicationNicknameQuery(nickname: nickname)
        self.petCommandoRepository.requestDuplicationNickname(nicknameQuery: nicknameQuery) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let statusCode):
                self.successDuplicationNickname.onNext(statusCode)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func excuteRegister(email: String, nickname: String, password: String) {
        let registerQuery = RegisterQuery(email: email, nickname: nickname, password: password)
        self.petCommandoRepository.requestRegister(registerQuery: registerQuery) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let statusCode):
                self.successRegister.onNext(statusCode)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func excuteLogin(email: String, password: String) {
        let loginQuery = LoginQuery(email: email, password: password)
        self.petCommandoRepository.requestLogin(loginQuery: loginQuery) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let statusCode):
                self.successLogin.onNext(statusCode)
            case .failure(let error):
                print(error)
            }
        }
    }
}

