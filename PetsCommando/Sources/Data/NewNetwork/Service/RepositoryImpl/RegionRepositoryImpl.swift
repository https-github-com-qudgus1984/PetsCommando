//
//  RegionRepositoryImpl.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/20.
//

import Foundation

enum RegionRepositoryError: Error {
    case request
}

final class RegionRepositoryImpl: RegionRepository {
    
    private let dataTransferService: DataTransferService
    
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
}

extension RegionRepositoryImpl {
    func fetchSidoList() async throws -> SidoList {
        let target = RegionAPIEndpoints.getSidoList()
        do {
            let data = try await dataTransferService.request(with: target)
            return data.toDomain
        } catch {
            throw RegionRepositoryError.request
        }
    }
    
    func fetchSigunguList(query: SigunguListQuery) async throws -> SigunguList {
        let requestDTO = RequestSigunguListDTO(sidoName: query.sidoName)
        let target = RegionAPIEndpoints.getSigunguList(with: requestDTO)
        
        do {
            let data = try await dataTransferService.request(with: target)
            return data.toDomain
        } catch {
            throw RegionRepositoryError.request
        }
    }
}
