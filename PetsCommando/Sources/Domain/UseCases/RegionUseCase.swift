//
//  RegionUseCase.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/20.
//

import Foundation

protocol RegionUseCase {
    func excuteSidoList() async throws -> SidoList
    func excuteSigunguList(query: SigunguListQuery) async throws -> SigunguList
}

enum RegionUseCaseError: String, Error {
    case excute
}

final class RegionUseCaseImpl: RegionUseCase {
    
    private let regionRepository: RegionRepository
    
    init(regionRepository: RegionRepository) {
        self.regionRepository = regionRepository
    }
}

extension RegionUseCaseImpl {
    func excuteSidoList() async throws -> SidoList {
        do {
            return try await
            regionRepository.fetchSidoList()
        } catch {
            throw RegionUseCaseError.excute
        }
    }
}

extension RegionUseCaseImpl {
    func excuteSigunguList(query: SigunguListQuery) async throws -> SigunguList {
        do {
            return try await
            regionRepository.fetchSigunguList(query: query)
        } catch {
            throw RegionUseCaseError.excute
        }
    }
}
