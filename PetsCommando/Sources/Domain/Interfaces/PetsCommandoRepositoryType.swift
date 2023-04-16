//
//  PetsCommandoRepositoryType.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/25.
//

import Foundation

protocol PetsCommandoRepositoryType: AnyObject {
    
    func requestDuplicationEmail(emailQuery: DuplicationEmailQuery, completion: @escaping (Result<Int, PetsCommandoNetworkServiceError>) -> Void
    )
    
    func requestDuplicationNickname(nicknameQuery: DuplicationNicknameQuery, completion: @escaping (Result<Int, PetsCommandoNetworkServiceError>) -> Void
    )
    
    func requestRegister(registerQuery: RegisterQuery, completion: @escaping (Result<Int, PetsCommandoNetworkServiceError>) -> Void
    )
    
    func requestLogin(loginQuery: LoginQuery, completion: @escaping
        (Result<Int, PetsCommandoNetworkServiceError>) -> Void
    )
    
//    func requestGetUserInfo(completion: @escaping
//        (Result<GetUserLoginInfo, PetsCommandoNetworkServiceError>) -> Void
//    )
}
