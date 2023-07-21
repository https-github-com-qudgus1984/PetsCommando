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
    private let organicAnimal: BehaviorRelay<List>
    
    init(coordinator: TabmanCoordinator?, organicAnimal: List) {
        self.coordinator = coordinator
        self.organicAnimal = BehaviorRelay(value: organicAnimal)
    }
    
    struct Input {

    }
    
    struct Output {
        let organicAnimal: BehaviorRelay<List>
    }

    var disposeBag = DisposeBag()
    
    func transform(_ input: Input) -> Output {
        return Output(organicAnimal: self.organicAnimal)
    }
}
