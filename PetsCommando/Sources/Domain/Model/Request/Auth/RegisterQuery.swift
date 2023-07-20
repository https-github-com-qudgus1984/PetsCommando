//
//  registerQuery.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/15.
//

import Foundation

struct RegisterQuery: Encodable {
    let email: String
    let nickname: String
    let password: String
}
