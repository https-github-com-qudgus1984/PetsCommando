//
//  OrganicAnimalList.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/20.
//

import Foundation

struct OrganicAnimalList: Hashable {
    let totalCount: Int
    let list: [List?]
}

struct List: Hashable {
    let desertionNo: String
    let filename: String
    let happenDt, happenPlace, kindCD, colorCD: String
    let age, weight, noticeNo, noticeSdt: String
    let noticeEdt: String
    let popfile: String
    let processState, sexCD, neuterYn, specialMark: String
    let careNm, careTel, careAddr, orgNm: String
    let chargeNm, officetel: String
}
