//
//  PetsCommandoRepository.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/25.
//

import Foundation
import Moya
import RxSwift

enum PetsCommandoNetworkServiceError: Int, Error {

    case duplicatedError = 201
    case inValidInputBodyError = 202
    case inValidIDTokenError = 401
    case inValidURL = 404
    case unregisterUser = 406
    case typeError = 415
    case internalServerError = 500
    case internalClientError = 501
    case unknown

    var description: String { self.errorDescription }
}

extension PetsCommandoNetworkServiceError {

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
    
    let provider: MoyaProvider<PetsCommandoTarget>

    init() { provider = MoyaProvider<PetsCommandoTarget>() }

}

//MARK: 이메일 중복 체크
extension PetsCommandoRepository {
    func requestDuplicationEmail(emailQuery: DuplicationEmailQuery, completion: @escaping (Result<DuplicationEmail, PetsCommandoNetworkServiceError>) -> Void ) {
        let requestDTO = DuplicationEmailRequestDTO(duplicationEmail: emailQuery)
        provider.request(.duplicationEmail(parameters: DuplicationEmailQuery(email: emailQuery.email))) { result in
            switch result {
            case .success(let response):
                print("성공했음")
                let data = try? JSONDecoder().decode(DuplicationEmailResponseDTO.self, from: response.data)
                guard let data = data else {
                    print("✅ ✅ ✅ ")
                    return }
                print("data@@@", data)
                completion(.success(data.toDomain()))
            case .failure(let error):
                print("실패했음")
               completion(.failure(PetsCommandoNetworkServiceError(rawValue: error.response!.statusCode) ?? .unknown))
            }
        }
    }
}

extension PetsCommandoRepository {
    func requestDuplicationNickname(nickname: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
    }
}

//MARK: Process 정의
extension PetsCommandoRepository {
    private func process(
        result: Result<Response, MoyaError>,
        completion: @escaping (Result<Int, PetsCommandoNetworkServiceError>) -> Void
    ) {
        switch result {
        case .success(let response):
            completion(.success(response.statusCode))
        case .failure(let error):
            print(error)
            completion(.failure(PetsCommandoNetworkServiceError(rawValue: error.response!.statusCode) ?? .unknown))
        }
    }

}
