//
//  HospitalRepositoryImpl.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/21.
//

import Foundation

enum HospitalRepositoryError: Error {
    case request
}

final class HospitalRepositoryImpl: HospitalRepository {
    
    private let dataTransferService: DataTransferService
    
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
}

extension HospitalRepositoryImpl {
    func fetchHospital() async throws -> [Hospital] {
        let target = HospitalAPIEndpoints.getHospital()
        
        do {
            let data = try await dataTransferService.request(with: target)
            return data.map { $0.toDomain }
        } catch {
            throw HospitalRepositoryError.request
        }
    }
}
