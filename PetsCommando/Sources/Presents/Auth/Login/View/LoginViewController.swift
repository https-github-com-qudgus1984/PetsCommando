//
//  LoginViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/04.
//

import UIKit
import RxSwift
import RxCocoa
import Toast

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
        self.hideKeyboard()
    }
    
    override func setupBinding() {
        
        let input = LoginViewModel.Input(idText: loginView.idLineTextField.textField.rx.text, pwText: loginView.pwLineTextField.textField.rx.text,     loginButtonTap: loginView.loginButton.rx.controlEvent(.touchUpInside).map {
            LoginQuery(
                email: self.loginView.idLineTextField.textField.text!,
                password: self.loginView.pwLineTextField.textField.text!
            )}
        )
        
        let output = viewModel.transform(input)
        
        //MARK: 여기서 화면전환 바꾸기
        loginView.signupButton.rx.tap
            .bind { [weak self] in
                guard let self = self else { return }
//                self.viewModel.showSidoViewController()
                self.viewModel.showSignUpViewController()
            }
            .disposed(by: disposeBag)
        
        output.loginValidation
            .withUnretained(self)
            .bind { vc, valid in
                let buttonColor: UIColor = valid ? Color.BaseColor.hunt2 : Color.BaseColor.gray6
                vc.loginView.loginButton.backgroundColor = buttonColor
            }
            .disposed(by: disposeBag)
        
        output.requestTextMessage.emit(onNext: {[unowned self] text in self.view.makeToast(text, position: .top)})
            .disposed(by: disposeBag)
    }
}

