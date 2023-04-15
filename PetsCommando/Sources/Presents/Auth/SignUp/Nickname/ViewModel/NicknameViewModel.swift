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
    private var certificationUseCase: CertificationUseCase

    init(coordinator: AuthCoordinator?, certificationUseCase: CertificationUseCase) {
        self.coordinator = coordinator
        self.certificationUseCase = certificationUseCase
    }
    
    struct Input {
        let nicknameText: ControlProperty<String?>
        let didNextButtonTap: Signal<String>
        let certificationButtonTap: Signal<String>
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
        
        input.certificationButtonTap
            .emit { [weak self] certificationNickname in
                guard let self = self else { return }
                print("닉네임 중복확인 실행")
                self.startDuplicationNickname(nickname: certificationNickname)
            }
            .disposed(by: disposeBag)
        
        return Output(nicknameValidation: nicknameValid, nicknameduplicationValidation: nicknameduplicationValid)
    }
}

extension NicknameViewModel {

    private func saveNicknameInfo(nickname: String) {
        UserDefaults.standard.set(nickname, forKey: UserDefaultKeyCase.nickname)
    }
    
    func startDuplicationNickname(nickname: String) {
        certificationUseCase.excuteNickname(nickname: nickname)
    }
}
