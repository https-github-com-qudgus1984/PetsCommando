//
//  PetsCommandoRepository.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/25.
//

import Foundation
import RxSwift

final class PetsCommandoRepository: PetsCommandoRepositoryType {
    
    private let session: PetsCommandoService

    init(session: PetsCommandoService) {
        self.session = session
    }
    
    func requestDuplicationEmail(email: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
        self.session.request(target: Router.email, type: [emailDTO].self)
    }
    
    func requestDuplicationNickname(nickname: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
        print("1")
    }
}
