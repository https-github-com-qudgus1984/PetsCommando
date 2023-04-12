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
        let emailduplicationValidation: Observable<Bool>
    }
    //MARK: UserCase에서 데이터가 잘 들어오면 True로 바꿔줄 변수
    var isDuplicationEmailSuccess = BehaviorRelay(value: false)
    
    var disposeBag = DisposeBag()
    
    func transform(_ input: Input) -> Output {
        let emailValid = input.emailText
            .orEmpty
            .map { $0.count >= 8 && $0.count <= 20 && $0.range(of: "@") != nil && $0.range(of: ".") != nil }
            .share()
        
        let emailDuplicationValid = Observable.combineLatest(isDuplicationEmailSuccess.asObservable(), emailValid)
            .flatMapLatest { isDuplicationSuccess, emailIsValid -> Observable<Bool> in
                if isDuplicationSuccess {
                    return Observable.just(true)
                } else {
                    return emailValid
                }
            }
        
        
        input.certificaionButtonTap
            .emit { [weak self] certificationEmail in
                guard let self = self else { return }
                print("이메일 중복확인 인증했다?")
                self.startDuplicationEmail(email: certificationEmail)
            }.disposed(by: disposeBag)
        
        //MARK: CertificationUseCase에서 데이터가 잘 날아오면 emailDuplication을 true로 변경해주려는 코드. 근데 제대로 안먹어서 해결필요
        self.certificationUseCase.successDuplicationEmail
            .subscribe { email in
                print(email,"@@@@@@")
                if email.isCompleted {
                    self.isDuplicationEmailSuccess.accept(true)
                }
            }
            .disposed(by: disposeBag)
                
        input.didNextButtonTap
            .emit { [weak self] text in
                guard let self = self else { return }
                self.saveEmailInfo(email: text)
                self.coordinator?.showNicknameViewController()
            }
            .disposed(by: disposeBag)
        
        
        
        return Output(emailValidation: emailValid, emailduplicationValidation: emailDuplicationValid)
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
