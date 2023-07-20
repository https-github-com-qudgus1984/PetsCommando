//
//  OrganicAnimalUseCase.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/20.
//

import Foundation

protocol OrganicAnimalUseCase {
    func excuteOrganicAnimalList(query: OrganicAnimalListQuery) async throws -> OrganicAnimalList
}

enum OrganicAnimalUseCaseError: String, Error {
    case excute
}

final class OrganicAnimalUseCaseImpl: OrganicAnimalUseCase {
    
    private let organicAnimalRepository: OrganicAnimalRepository
    
    init(organicAnimalRepository: OrganicAnimalRepository) {
        self.organicAnimalRepository = organicAnimalRepository
    }
}

extension OrganicAnimalUseCaseImpl {
    func excuteOrganicAnimalList(query: OrganicAnimalListQuery) async throws -> OrganicAnimalList {
        do {
            return try await organicAnimalRepository.fetchOrganicAnimalList(query: query)
        } catch {
            throw OrganicAnimalUseCaseError.excute
        }
    }
}
