//
//  MyProfileViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/21.
//

import UIKit
import RxSwift
import RxCocoa

final class MyProfileViewModel: ViewModelType {
    private weak var coordinator: MyProfileCoordinator?

    init(coordinator: MyProfileCoordinator?) {
        self.coordinator = coordinator
    }
    
    var disposeBag = DisposeBag()
    
    struct Input {
        let nicknameModifyButtonTap: ControlEvent<Void>
        let locationModifyButtonTap: ControlEvent<Void>
    }

    struct Output {

    }
    
    func transform(_ input: Input) -> Output {
        input.locationModifyButtonTap.bind { [weak self] _ in
            guard let self else { return }
            self.coordinator?.showLocationModifySidoViewController()
        }
        .disposed(by: disposeBag)
        
        return Output()
    }
}
