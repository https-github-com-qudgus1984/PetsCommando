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
        let requestTextMessage: Signal<String>
        let totalValidation: Observable<Bool>
    }
    
    var isDuplicationNicknameSuccess = BehaviorRelay<Bool>(value: false)
    var requestText = PublishRelay<String>()

    private let userDefaults = UserDefaults.standard
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
                print(text, "닉네임 저장")
                self.saveNicknameInfo(nickname: text)
                print(userDefaults.string(forKey: UserDefaultKeyCase.nickname))
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
            .subscribe { event in
                switch event {
                case .next(let statusCode):
                    switch statusCode {
                    case 200:
                        self.isDuplicationNicknameSuccess.accept(true)
                        self.userDefaults.string(forKey: UserDefaultKeyCase.nickname)
                        self.requestText.accept("닉네임 중복 확인 되었습니다.")
                    case 400:
                        self.requestText.accept("사용할 수 없는 닉네임입니다.")
                    case 409:
                        self.requestText.accept("이 닉네임은 이미 존재하여 사용할 수 없습니다.")
                    default:
                        self.requestText.accept("정의되지 않은 오류입니다.\(statusCode)")
                    }
                case .error(let error):
                    self.requestText.accept(error.localizedDescription)
                case .completed:
                    print("completed")
                }
            }
            .disposed(by: disposeBag)
        
        return Output(nicknameValidation: nicknameValid, nicknameduplicationValidation: self.isDuplicationNicknameSuccess, requestTextMessage: requestText.asSignal(),
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
