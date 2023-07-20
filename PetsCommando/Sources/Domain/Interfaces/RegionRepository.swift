//
//  RegionRepository.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/20.
//

import Foundation

protocol RegionRepository: AnyObject {
    func fetchSidoList() async throws -> SidoList
    
    func fetchSigunguList(query: SigunguListQuery) async throws -> SigunguList
}
