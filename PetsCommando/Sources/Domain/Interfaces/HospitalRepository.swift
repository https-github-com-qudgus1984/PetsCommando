//
//  HospitalRepository.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/21.
//

import Foundation

protocol HospitalRepository: AnyObject {
    func fetchHospital() async throws -> [Hospital]
}
