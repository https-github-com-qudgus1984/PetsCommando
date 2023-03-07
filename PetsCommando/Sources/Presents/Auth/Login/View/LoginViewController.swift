//
//  LoginViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/04.
//

import UIKit
import SnapKit


final class LoginViewController: BaseViewController {
    
    let loginView = LoginView()
    
    //MARK: Delegate
//    weak var coordinator: LoginCoordinator?
    
    override func loadView() {
        super.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setupBinding() {
        loginView.signupButton.addTarget(self, action: #selector(signupButtonClicked), for: .touchUpInside)
    }
    
    @objc
    func signupButtonClicked() {
        print("클릭클릭")
//        self.coordinator?.startSignUp()
    }
}

