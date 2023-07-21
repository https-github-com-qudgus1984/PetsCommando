//
//  ResponseHospitalListDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/21.
//

import Foundation

struct ResponseHospitalListDTO: Codable {
    let loadId: String
    let isOpen: String
    let phoneNum: String
    let address: String
    let postNum: String
    let name: String
    let x: String
    let y: String
    
    enum CodingKeys: String, CodingKey {
        case loadId, isOpen, phoneNum, address, postNum, name, x, y
    }
}

extension ResponseHospitalListDTO {
    var toDomain: Hospital {
        .init(loadId: loadId, isOpen: isOpen, phoneNum: phoneNum, address: address, postNum: postNum, name: name, x: x, y: y)
    }
}
