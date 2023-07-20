//
//  OrganicAPIEndpoints.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/20.
//

import Foundation

struct OrganicAPIEndpoints {
    
    static func getOrganicAnimal(with requestDTO: RequestOrganicAnimalListDTO) -> OrganicAnimalRouter<ResponseOrganicAnimalListDTO> {
        return OrganicAnimalRouter<ResponseOrganicAnimalListDTO>.organicAnimal(parameters: OrganicAnimalListQuery(sido: requestDTO.sido, sigungu: requestDTO.sigungu))
    }
}
