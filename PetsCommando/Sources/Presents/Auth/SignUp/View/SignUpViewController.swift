//
//  SignUpViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/06.
//

import UIKit
import SnapKit


final class SignUpViewController: BaseViewController {
    
    private let mainView = SignUpView()
    private let viewModel = SignUpViewModel()
    //MARK: Delegate
    weak var coordinator: SignUpCoordinator?
    
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: ViewModel Binding
    override func setupBinding() {
        let input = SignUpViewModel.Input(idText: mainView.idLineTextField.textField.rx.text, pwText: mainView.pwLineTextField.textField.rx.text, checkpwText: mainView.checkpwLineTextField.textField.rx.text)
        
        let output = viewModel.transform(input)
        
        output.idValidation
            .withUnretained(self)
            .bind { vc, valid in
                let buttonColor: UIColor = valid ? Color.BaseColor.hunt2 : Color.BaseColor.gray6
                vc.mainView.idCertificationButton.backgroundColor = buttonColor
                let textColor: UIColor = valid ? .systemBlue : .systemRed
                vc.mainView.idValidLabel.textColor = textColor
                let str: String = valid ?
                "인증이 완료되었습니다." : "ID 중복 검사가 필요합니다."
                vc.mainView.idValidLabel.text = str
            }
            .disposed(by: disposeBag)
        
        output.pwValidation
            .withUnretained(self)
            .bind { vc, valid in
                let str: String = valid ?
                " " : "비밀번호가 일치하지 않습니다."
                vc.mainView.pwValidLabel.text = str
            }
            .disposed(by: disposeBag)
        
        output.signUpValidation
            .withUnretained(self)
            .bind { vc, valid in
                let buttonColor: UIColor = valid ? Color.BaseColor.hunt2 : Color.BaseColor.gray6
                vc.mainView.signupButton.backgroundColor = buttonColor
            }
            .disposed(by: disposeBag)
    }
}

