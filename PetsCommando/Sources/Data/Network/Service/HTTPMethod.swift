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


struct Person {
    let name: String
}

var people = [
    Person(name: "사람1"),
    Person(name: "사람22"),
    Person(name: "사람333")
]

func longestName() -> String {
    return people
        .sorted(by: { $0.name.count > $1.name.count })
        .first!
        .name
}

func shortestName() -> String {
    return people
        .sorted(by: { $0.name.count > $1.name.count })
        .last!
        .name
}

print(longestName())
print(shortestName())


extension Collection where Element == String {
    func sortedByLength() -> [Element] {
        return sorted(by: { $0.count < $1.count })
    }
}

func gLongestName() -> String {
    return people
        .map(\.name)
        .sortedByLength()
        .last!
}

print(gLongestName())
