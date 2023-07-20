//
//  OrganicAnimalRepositoryImpl.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/20.
//

import Foundation

enum OrganicAnimalRepositoryError: Error {
    case request
}

final class OrganicAnimalRepositoryImpl: OrganicAnimalRepository {
    
    private let dataTransferService: DataTransferService
    
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
}

extension OrganicAnimalRepositoryImpl {
    func fetchOrganicAnimalList(query: OrganicAnimalListQuery) async throws -> OrganicAnimalList {
        let requestDTO = RequestOrganicAnimalListDTO(sido: query.sido, sigungu: query.sigungu)
        let target = OrganicAPIEndpoints.getOrganicAnimal(with: requestDTO)
        
        do {
            let data = try await dataTransferService.request(with: target)
            return data.toDomain
        } catch {
            throw OrganicAnimalRepositoryError.request
        }
    }
}
