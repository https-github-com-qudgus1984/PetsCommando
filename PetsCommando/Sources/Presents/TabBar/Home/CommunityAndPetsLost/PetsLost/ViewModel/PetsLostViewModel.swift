//
//  PetsLostViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/19.
//

import Foundation
import RxSwift
import RxCocoa

final class PetsLostViewModel: ViewModelType {
    
    weak var coordinator: TabmanCoordinator?
    
    init(coordinator: TabmanCoordinator?) {
        self.coordinator = coordinator
    }
    
    struct Input {
        let cellSelected: PublishSubject<Void>
    }
    
    struct Output {

    }

    var disposeBag = DisposeBag()
    
    func transform(_ input: Input) -> Output {
        input.cellSelected
            .bind { [weak self] _ in
                guard let self else { return }
                self.coordinator?.showPetsLostDetailViewController()
            }
            .disposed(by: disposeBag)
        return Output()
    }
}
