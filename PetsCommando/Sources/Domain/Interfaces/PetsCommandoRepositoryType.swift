//
//  PetsCommandoRepositoryType.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/25.
//

import Foundation

protocol PetsCommandoRepositoryType: AnyObject {
    
    func requestDuplicationEmail(email: String, completion: @escaping (Result <String, NetworkError>) -> Void
    )
    
    func requestDuplicationNickname(nickname: String, completion: @escaping (Result <String, NetworkError>) -> Void
    )
    
}
