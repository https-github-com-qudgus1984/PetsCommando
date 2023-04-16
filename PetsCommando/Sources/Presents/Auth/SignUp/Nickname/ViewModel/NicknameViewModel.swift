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
        let nicknameduplicationValidation: BehaviorRelay<Bool>
        let totalValidation: Observable<Bool>
    }
    
    var isDuplicationNicknameSuccess = BehaviorRelay<Bool>(value: false)

    var disposeBag = DisposeBag()
    
    func transform(_ input: Input) -> Output {
        let nicknameValid = input.nicknameText
            .orEmpty
            .map { $0.count >= 2 && $0.count <= 10 }
            .share()
        
        let totalValid = Observable.combineLatest(isDuplicationNicknameSuccess.asObservable(), nicknameValid)
            .map { isDuplicationSuccess, nicknameValid in
                return isDuplicationSuccess && nicknameValid
            }
        
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
        
        self.certificationUseCase.successDuplicationNickname
            .subscribe { success in
                if success {
                    self.isDuplicationNicknameSuccess.accept(true)
                }
            }
            .disposed(by: disposeBag)
        
        return Output(nicknameValidation: nicknameValid, nicknameduplicationValidation: self.isDuplicationNicknameSuccess,
        totalValidation: totalValid)
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
