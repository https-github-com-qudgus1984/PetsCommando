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
    
    init(
        userRepository: UserRepositoryType
    ) {
        self.userRepository = userRepository
    }
}

