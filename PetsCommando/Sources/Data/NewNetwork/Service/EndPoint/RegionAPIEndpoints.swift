//
//  RegionAPIEndpoints.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/20.
//

import Foundation

struct RegionAPIEndpoints {
    static func getSidoList() -> RegionRouter<ResponseSidoListDTO> {
        return RegionRouter<ResponseSidoListDTO>.sido
    }
    
    static func getSigunguList(with requestDTO: RequestSigunguListDTO) -> RegionRouter<ResponseSigunguListDTO> {
        return RegionRouter<ResponseSigunguListDTO>.sigungu(parameters: SigunguListQuery(sidoName: requestDTO.sidoName))
    }
}
