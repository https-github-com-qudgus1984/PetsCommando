//
//  HTTPMethod.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/22.
//

import Foundation

enum HTTPMethod: String {
    case get
    case post
}



protocol HTTP {
    var path: String { get set }
}
