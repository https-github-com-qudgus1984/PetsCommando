//
//  DataTransferService.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/20.
//

import Foundation

enum DataTransferError: Error {
    case noResponse
    case decode
}

final class DataTransferService {
    
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func request<T: Decodable, E: NewTargetType>(with target: E) async throws -> T where E.Response == T {
        do {
            let responseData = try await networkService.request(target: target)
            let decodedData = try JSONDecoder().decode(T.self, from: responseData)
            return decodedData
        } catch {
            print("👊", DataTransferError.decode)
            throw DataTransferError.decode
        }
    }
}
