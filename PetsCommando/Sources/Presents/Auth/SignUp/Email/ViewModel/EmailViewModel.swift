//
//  EmailViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/25.
//

import Foundation
import RxSwift
import RxCocoa

final class EmailViewModel: ViewModelType {
    
    private weak var coordinator: AuthCoordinator?
    private var certificationUseCase: CertificationUseCase

    init(coordinator: AuthCoordinator?, certificationUseCase: CertificationUseCase) {
        self.coordinator = coordinator
        self.certificationUseCase = certificationUseCase
    }
    
    struct Input {
        let emailText: ControlProperty<String?>
        let certificaionButtonTap: Signal<String>
        let didNextButtonTap: Signal<String>
    }

    struct Output {
        let emailValidation: Observable<Bool>
        let emailduplicationValidation: BehaviorRelay<Bool>
        let totalValidation: Observable<Bool>
    }
    //MARK: UserCase에서 데이터가 잘 들어오면 True로 바꿔줄 변수
    var isDuplicationEmailSuccess = BehaviorRelay<Bool>(value: false)
    
    var disposeBag = DisposeBag()
    
    func transform(_ input: Input) -> Output {
        let emailValid = input.emailText
            .orEmpty
            .map { $0.count >= 8 && $0.count <= 20 && $0.range(of: "@") != nil && $0.range(of: ".") != nil }
            .share()
        
        let totalValid = Observable.combineLatest(isDuplicationEmailSuccess.asObservable(), emailValid)
            .map { isDuplicationSuccess, emailValid in
                return isDuplicationSuccess && emailValid
            }
        
        input.certificaionButtonTap
            .emit { [weak self] certificationEmail in
                guard let self = self else { return }
                print("이메일 중복확인 인증했다?")
                self.startDuplicationEmail(email: certificationEmail)
            }.disposed(by: disposeBag)
        
        
        self.certificationUseCase.successDuplicationEmail
            .subscribe { success in
                if success {
                    self.isDuplicationEmailSuccess.accept(true)
                }
            }.disposed(by: disposeBag)
                
        input.didNextButtonTap
            .emit { [weak self] text in
                guard let self = self else { return }
                self.saveEmailInfo(email: text)
                self.coordinator?.showNicknameViewController()
            }
            .disposed(by: disposeBag)
        
        
        
        return Output(emailValidation: emailValid, emailduplicationValidation: self.isDuplicationEmailSuccess,
        totalValidation: totalValid)
    }
    
    func startDuplicationEmail(email: String) {
        certificationUseCase.excuteEmail(email: email)
    }
}

extension EmailViewModel {

    private func saveEmailInfo(email: String) {
        UserDefaults.standard.set(email, forKey: UserDefaultKeyCase.email)
    }
}
