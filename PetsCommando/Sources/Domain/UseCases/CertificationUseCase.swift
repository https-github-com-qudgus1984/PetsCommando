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
    
    var successDuplicationEmail = PublishSubject<DuplicationEmail>()
    var successDuplicationNickname = PublishSubject<DuplicationNickname>()
    var successRegister = PublishSubject<Register>()
    var successLogin = PublishSubject<Login>()

    
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
            case .success(let duplicationEmail):
                self.userDefaults.string(forKey: UserDefaultKeyCase.email)
                self.successDuplicationEmail.onNext(duplicationEmail)
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
            case .success(let duplicationNickname):
                self.userDefaults.set(nickname, forKey: UserDefaultKeyCase.nickname)
                self.successDuplicationNickname.onNext(duplicationNickname)
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
            case .success(let register):
                print(register)
                self.successRegister.onNext(register)
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
            case .success(let login):
                print(login)
                self.successLogin.onNext(login)
            case .failure(let error):
                print(error)
            }
        }
    }
}

