//
//  NSObject + Extension.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/15.
//

import Foundation

extension NSObject {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}
