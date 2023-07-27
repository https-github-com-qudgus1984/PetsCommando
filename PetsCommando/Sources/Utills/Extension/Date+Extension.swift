//
//  Date+Extension.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

extension Date {
    static var timestamp: Int64 {
        Int64(Date().timeIntervalSince1970 * 1000)
    }
}
