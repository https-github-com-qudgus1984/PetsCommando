//
//  NicknameViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/25.
//

import Foundation
import RxSwift
import RxCocoa

final class NicknameViewModel: ViewModelType {
    
    private weak var coordinator: AuthCoordinator?

    init(coordinator: AuthCoordinator?) {
        self.coordinator = coordinator
    }
    
    struct Input {
        let nicknameText: ControlProperty<String?>
        let didNextButtonTap: Signal<String>

    }

    struct Output {
        let nicknameValidation: Observable<Bool>
        let nicknameduplicationValidation: Observable<Bool>
    }
    
    var disposeBag = DisposeBag()
    
    func transform(_ input: Input) -> Output {
        let nicknameValid = input.nicknameText
            .orEmpty
            .map { $0.count >= 2 && $0.count <= 10 }
            .share()
        
        let nicknameduplicationValid = input.nicknameText
            .orEmpty
            .map { $0.count >= 2 && $0.count <= 10 }
            .share()
        
        input.didNextButtonTap
            .emit { [weak self] text in
                guard let self = self else { return }
                self.saveNicknameInfo(nickname: text)
                self.coordinator?.showPasswordViewController()
            }
            .disposed(by: disposeBag)
        
        return Output(nicknameValidation: nicknameValid, nicknameduplicationValidation: nicknameduplicationValid)
    }
}

extension NicknameViewModel {

    private func saveNicknameInfo(nickname: String) {
        UserDefaults.standard.set(nickname, forKey: UserDefaultKeyCase.nickname)
    }
}
