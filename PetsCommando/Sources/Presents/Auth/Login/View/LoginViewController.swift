//
//  LoginViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/04.
//

import UIKit
import RxSwift
import RxCocoa

final class LoginViewController: BaseViewController {
    
    let mainView = LoginView()
    
    //MARK: Delegate
    weak var coordinator: LoginCoordinator?
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setupBinding() {
        mainView.signupButton.rx.tap
            .bind { [weak self] in
                guard let self = self else { return }
                self.coordinator?.pushSignUpViewController()
            }
            .disposed(by: disposeBag)
    }
}

