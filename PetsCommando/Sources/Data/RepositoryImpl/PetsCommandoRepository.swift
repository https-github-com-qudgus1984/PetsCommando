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
    func requestDuplicationEmail(emailQuery: DuplicationEmailQuery, completion: @escaping (Result<Int, PetsCommandoNetworkServiceError>) -> Void ) {
        provider.request(.duplicationEmail(parameters: DuplicationEmailQuery(email: emailQuery.email))) { result in
            switch result {
            case .success(let response):
                let data = try? JSONDecoder().decode(DuplicationEmailResponseDTO.self, from: response.data)
                guard let data = data else { return }
                print("✅✅✅",data, response.statusCode)
                completion(.success(response.statusCode))
            case .failure(let error):
                print("에러에러", error)
               completion(.failure(PetsCommandoNetworkServiceError(rawValue: error.response!.statusCode) ?? .unknown))
            }
        }
    }
}

extension PetsCommandoRepository {

    func requestDuplicationNickname(nicknameQuery: DuplicationNicknameQuery, completion: @escaping (Result<Int, PetsCommandoNetworkServiceError>) -> Void) {
        provider.request(.duplicationNickname(parameters: DuplicationNicknameQuery(nickname: nicknameQuery.nickname))) { result in
            switch result {
            case .success(let response):
                let data = try? JSONDecoder().decode(DuplicationNicknameResponseDTO.self, from: response.data)
                guard let data = data else { return }
                print("닉네임 중복검사 : ✅✅✅",data, response.statusCode)
                completion(.success(response.statusCode))
            case .failure(let error):
                print("닉네임 중복검사 : 에러에러", error)
               completion(.failure(PetsCommandoNetworkServiceError(rawValue: error.response!.statusCode) ?? .unknown))
            }
        }
    }
}

extension PetsCommandoRepository {
    
    func requestRegister(registerQuery: RegisterQuery, completion: @escaping (Result<Int, PetsCommandoNetworkServiceError>) -> Void) {
        provider.request(.register(parameter: registerQuery.self)) { result in
            switch result {
            case .success(let response):
                let data = try? JSONDecoder().decode(RegisterResponseDTO.self, from: response.data)
                guard let data = data else { return }
                print("Rigster 서버통신 : ✅✅✅",data, response.statusCode)
//                completion(.success(data.toDomain()))
                completion(.success(response.statusCode))
            case .failure(let error):
                print("Rigster 에러에러", error)
               completion(.failure(PetsCommandoNetworkServiceError(rawValue: error.response!.statusCode) ?? .unknown))
            }
        }
    }
}

extension PetsCommandoRepository {
    func requestLogin(loginQuery: LoginQuery, completion: @escaping (Result<Int, PetsCommandoNetworkServiceError>) -> Void) {
        provider.request(.login(parameter: loginQuery.self)) { result in
            switch result {
            case .success(let response):
                let data = try? JSONDecoder().decode(LoginResponseDTO.self, from: response.data)
                guard let data = data else { return }
                print("login 서버통신 : ✅✅✅",data, response.statusCode)
//                completion(.success(data.toDomain()))
                completion(.success(response.statusCode))
            case .failure(let error):
                print("login 에러에러", error)
                completion(.failure(PetsCommandoNetworkServiceError(rawValue: error.response!.statusCode) ?? .unknown))
            }
        }
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
