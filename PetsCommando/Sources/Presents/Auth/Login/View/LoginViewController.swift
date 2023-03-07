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
    
    private let mainView = LoginView()
    private let viewModel = LoginViewModel()
    
    //MARK: Delegate
    weak var coordinator: LoginCoordinator?
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setupBinding() {
        
        let input = LoginViewModel.Input(idText: mainView.idLineTextField.textField.rx.text, pwText: mainView.pwLineTextField.textField.rx.text)
        
        let output = viewModel.transform(input)
        
        mainView.signupButton.rx.tap
            .bind { [weak self] in
                guard let self = self else { return }
                self.coordinator?.pushSignUpViewController()
            }
            .disposed(by: disposeBag)
        
        output.signUpValidation
            .withUnretained(self)
            .bind { vc, valid in
                let buttonColor: UIColor = valid ? Color.BaseColor.hunt2 : Color.BaseColor.gray6

                vc.mainView.loginButton.backgroundColor = buttonColor
            }
            .disposed(by: disposeBag)
        
    }
}

