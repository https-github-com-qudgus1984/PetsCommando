//
//  HospitalUseCase.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/21.
//

import Foundation

protocol HospitalUseCase {
    func excuteHospital() async throws -> [Hospital]
}

enum HospitalUseCaseError: String, Error {
    case excute
}

final class HospitalUseCaseImpl: HospitalUseCase {
    
    private let hospitalRepository: HospitalRepository
    
    init(hospitalRepository: HospitalRepository) {
        self.hospitalRepository = hospitalRepository
    }
}

extension HospitalUseCaseImpl {
    func excuteHospital() async throws -> [Hospital] {
        do {
            return try await hospitalRepository.fetchHospital()
        } catch {
            throw HospitalUseCaseError.excute
        }
    }
}
