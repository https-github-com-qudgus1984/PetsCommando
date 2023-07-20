//
//  OragicAnimalRepository.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/20.
//

import Foundation

protocol OrganicAnimalRepository: AnyObject {
    func fetchOrganicAnimalList(query: OrganicAnimalListQuery) async throws -> OrganicAnimalList
}
