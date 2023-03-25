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


// haha1haka making... to git

protocol HTTP {
    var path: String { get set }
}
