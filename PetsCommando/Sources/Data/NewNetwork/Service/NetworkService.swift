//
//  NetworkService.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/20.
//

import Foundation

final class NetworkService {
    
    func request(target: any NewTargetType) async throws -> Data {
        do {
            let urlRequest = target.request
            print(urlRequest, "보내는 URL")
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
             guard let response = response as? HTTPURLResponse else { throw NetworkError.httpURLResponse}
            
            switch response.statusCode {
            case 200..<300:
                return data
            case 400..<500:
                print("😅 Network ERROR", response.statusCode)
                throw NetworkError.clientError
            case 500..<599:
                print("😅 SERVER ERROR", response.statusCode)
                throw NetworkError.serverError
            default:
                print("😅 INTERNAL ERROR", response.statusCode)
                throw NetworkError.internalError
            }
        } catch {
            throw NetworkError.unexpectedData
        }
    }
}
