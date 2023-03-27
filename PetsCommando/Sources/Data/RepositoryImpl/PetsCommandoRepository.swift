//
//  PetsCommandoRepository.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/25.
//

import Foundation
import RxSwift

enum PetsCommandoServiceError: Int, Error {

    case duplicatedError = 201
    case inValidInputBodyError = 202
    case inValidIDTokenError = 401
    case inValidURL = 404
    case unregisterUser = 406
    case internalServerError = 500
    case internalClientError = 501
    case unknown

    var description: String { self.errorDescription }
}

extension PetsCommandoServiceError {

    var errorDescription: String {
        switch self {
        case .duplicatedError: return "201:DUPLICATE_ERROR"
        case .inValidInputBodyError: return "202:INVALID_INPUT_BODY_ERROR"
        case .inValidIDTokenError: return "401:INVALID_FCM_TOKEN_ERROR"
        case .inValidURL: return "404:INVALID_URL_ERROR"
        case .unregisterUser: return "406:UNREGISTER_USER_ERROR"
        case .internalServerError: return "500:INTERNAL_SERVER_ERROR"
        case .internalClientError: return "501:INTERNAL_CLIENT_ERROR"
        default: return "UN_KNOWN_ERROR"
        }
    }
}

final class PetsCommandoRepository: PetsCommandoRepositoryType {

    
    private let session: PetsCommandoService

    init(session: PetsCommandoService) {
        self.session = session
    }

    func requestDuplicationEmail(email: String) async throws -> Bool {
        let url = URL(string: "http://13.125.239.168:9090/noauth/users/email-duplication")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        let requestData = try encoder.encode(email)
        request.httpBody = requestData
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        print(data)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw PetsCommandoServiceError.inValidURL
        }
        
        if httpResponse.statusCode == 200 {
            return true
        } else {
            throw PetsCommandoServiceError.unknown
        }
    }
    
    func requestDuplicationNickname(nickname: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
        print("1")
    }
}
