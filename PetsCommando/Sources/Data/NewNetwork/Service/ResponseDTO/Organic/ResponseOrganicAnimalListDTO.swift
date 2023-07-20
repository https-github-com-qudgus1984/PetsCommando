//
//  ResponseOrganicAnimalListDTO.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/20.
//

import Foundation

struct ResponseOrganicAnimalListDTO: Codable {
    let totalCount: Int
    let list: [ResponseListDTO?]
    
    enum CodingKeys: String, CodingKey {
        case totalCount, list
    }
}

extension ResponseOrganicAnimalListDTO {
    var toDomain: OrganicAnimalList {
        .init(totalCount: totalCount, list: list.map{ $0?.toDomain })
    }
}

struct ResponseListDTO: Codable {
    let desertionNo: String
    let filename: String
    let happenDt, happenPlace, kindCd, colorCd: String
    let age, weight, noticeNo, noticeSdt: String
    let noticeEdt: String
    let popfile: String
    let processState, sexCd, neuterYn, specialMark: String
    let careNm, careTel, careAddr, orgNm: String
    let chargeNm, officetel: String
    
    enum codingKeys: String, CodingKey {
        case desertionNo, filename, happenDt, happenPlace, kindCd, colorCd, age, weight, noticeNo, noticeSdt, noticeEdt, popfile, processState, sexCd, neuterYn, specialMark, careNm, careTel, careAddr, orgNm, chargeNm, officetel
    }
}

extension ResponseListDTO {
    var toDomain: List {
        .init(desertionNo: desertionNo, filename: filename, happenDt: happenDt, happenPlace: happenPlace, kindCD: kindCd, colorCD: colorCd, age: age, weight: weight, noticeNo: noticeNo, noticeSdt: noticeSdt, noticeEdt: noticeEdt, popfile: popfile, processState: processState, sexCD: sexCd, neuterYn: neuterYn, specialMark: specialMark, careNm: careNm, careTel: careTel, careAddr: careAddr, orgNm: orgNm, chargeNm: chargeNm, officetel: officetel)
    }
}
