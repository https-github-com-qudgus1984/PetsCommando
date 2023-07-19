//
//  CommunityDetailViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/19.
//

import Foundation
import RxSwift
import RxCocoa

final class PetsLostDetailViewModel: ViewModelType {
    
    private weak var coordinator: TabmanCoordinator?
    
    init(coordinator: TabmanCoordinator?) {
        self.coordinator = coordinator
    }
    
    struct Input {

    }
    
    struct Output {

    }

    var disposeBag = DisposeBag()
    
    func transform(_ input: Input) -> Output {
        return Output()
    }
}
