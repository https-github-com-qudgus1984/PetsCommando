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
    
    private let loginView = LoginView()
    private let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("GenderViewController: fatal error")
    }
    
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setupBinding() {
        
        let input = LoginViewModel.Input(idText: loginView.idLineTextField.textField.rx.text, pwText: loginView.pwLineTextField.textField.rx.text)
        
        let output = viewModel.transform(input)
        
        loginView.signupButton.rx.tap
            .bind { [weak self] in
                guard let self = self else { return }
                self.viewModel.showSignUpViewController()
            }
            .disposed(by: disposeBag)
        
        output.signUpValidation
            .withUnretained(self)
            .bind { vc, valid in
                let buttonColor: UIColor = valid ? Color.BaseColor.hunt2 : Color.BaseColor.gray6
                vc.loginView.loginButton.backgroundColor = buttonColor
            }
            .disposed(by: disposeBag)
        
        loginView.loginButton.rx.tap
            .bind { [weak self] in
                guard let self = self else { return }
                self.viewModel.showTabBarController()
            }
            .disposed(by: disposeBag)
    }
}

