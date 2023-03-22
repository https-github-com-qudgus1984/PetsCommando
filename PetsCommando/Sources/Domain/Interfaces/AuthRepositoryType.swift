//
//  AuthRepositoryType.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/22.
//

import Foundation

protocol AuthRepositoryType: AnyObject {

    func verifyEmail(
        email: String,
        completion: @escaping (
            Result <String,
            NetworkError>
        ) -> Void
    )

    func signIn(
        email: String,
        nickname: String,
        password: String,
        completion: @escaping (
            Result <Void,
            NetworkError>
        ) -> Void
    )

    func requestIdtoken(
        completion: @escaping (
            Result <String,
            NetworkError>
        ) -> Void
    )
}
