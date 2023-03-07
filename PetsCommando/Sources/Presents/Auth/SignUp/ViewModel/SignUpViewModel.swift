//
//  SignUpViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/07.
//

import Foundation
import RxSwift


final class SignUpViewModel: ViewModelType {
    struct Input {
    }

    struct Output {
    }
    
    var input: Input
    var output: Output
    
    init(input: Input, output: Output) {
        self.input = input
        self.output = output
    }
}

