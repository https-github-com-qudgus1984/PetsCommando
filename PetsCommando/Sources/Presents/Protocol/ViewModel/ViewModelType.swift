//
//  ViewModelType.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/02/06.
//

import Foundation

protocol ViewModelType {
    
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
