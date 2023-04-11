//
//  PetsCommandoRepositoryType.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/25.
//

import Foundation

protocol PetsCommandoRepositoryType: AnyObject {
    
    func requestDuplicationEmail(emailQuery: DuplicationEmailQuery, completion: @escaping (Result<DuplicationEmail, PetsCommandoNetworkServiceError>) -> Void
    )
    
    func requestDuplicationNickname(nickname: String, completion: @escaping (Result <String, NetworkError>) -> Void
    )
}
