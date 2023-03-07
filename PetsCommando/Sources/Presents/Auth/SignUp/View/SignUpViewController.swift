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
                ValidationString.successAuth.text : ValidationString.duplicateInspection.text
                vc.mainView.idValidLabel.text = str
            }
            .disposed(by: disposeBag)
        
        output.pwValidation
            .withUnretained(self)
            .bind { vc, valid in
                let str: String = valid ?
                ValidationString.samePW.text : ValidationString.notSamePW.text
                vc.mainView.pwValidLabel.text = str
                let textColor: UIColor = valid ? .systemBlue : .systemRed
                vc.mainView.pwValidLabel.textColor = textColor

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

