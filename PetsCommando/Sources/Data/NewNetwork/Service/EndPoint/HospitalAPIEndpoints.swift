//
//  HospitalAPIEndpoints.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/21.
//

import Foundation

struct HospitalAPIEndpoints {
    
    static func getHospital() -> HospitalRouter<[ResponseHospitalListDTO]> {
        return HospitalRouter<[ResponseHospitalListDTO]>.hospital
    }
}
