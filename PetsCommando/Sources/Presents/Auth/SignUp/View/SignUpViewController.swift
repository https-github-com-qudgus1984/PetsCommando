//
//  SignUpViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/06.
//

import UIKit
import SnapKit


final class SignUpViewController: BaseViewController {
    
    private let signUpView = SignUpView()
    private let viewModel: SignUpViewModel
    //MARK: Delegate
    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("GenderViewController: fatal error")
    }
    
    override func loadView() {
        self.view = signUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: ViewModel Binding
    override func setupBinding() {
        let input = SignUpViewModel.Input(idText: signUpView.idLineTextField.textField.rx.text, pwText: signUpView.pwLineTextField.textField.rx.text, checkpwText: signUpView.checkpwLineTextField.textField.rx.text)
        
        let output = viewModel.transform(input)
        
        output.idValidation
            .withUnretained(self)
            .bind { vc, valid in
                let buttonColor: UIColor = valid ? Color.BaseColor.hunt2 : Color.BaseColor.gray6
                vc.signUpView.idCertificationButton.backgroundColor = buttonColor
                let textColor: UIColor = valid ? .systemBlue : .systemRed
                vc.signUpView.idValidLabel.textColor = textColor
                let str: String = valid ?
                ValidationString.successAuth.text : ValidationString.duplicateInspection.text
                vc.signUpView.idValidLabel.text = str
            }
            .disposed(by: disposeBag)
        
        output.pwValidation
            .withUnretained(self)
            .bind { vc, valid in
                let str: String = valid ?
                ValidationString.samePW.text : ValidationString.notSamePW.text
                vc.signUpView.pwValidLabel.text = str
                let textColor: UIColor = valid ? .systemBlue : .systemRed
                vc.signUpView.pwValidLabel.textColor = textColor

            }
            .disposed(by: disposeBag)
        
        output.signUpValidation
            .withUnretained(self)
            .bind { vc, valid in
                let buttonColor: UIColor = valid ? Color.BaseColor.hunt2 : Color.BaseColor.gray6
                vc.signUpView.signupButton.backgroundColor = buttonColor
                
            }
            .disposed(by: disposeBag)
    }
}

