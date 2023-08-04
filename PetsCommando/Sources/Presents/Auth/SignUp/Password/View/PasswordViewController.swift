//
//  PasswordViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/25.
//

import UIKit
import RxSwift
import RxCocoa
import Toast

final class PasswordViewController: BaseViewController {
    
    private let passwordView = PasswordView()
    private let viewModel: PasswordViewModel
    
    //MARK: Input
    private lazy var input = PasswordViewModel.Input(passwordText: self.passwordView.passwordLineTextField.textField.rx.text, checkpwText: self.passwordView.checkPasswordLineTextField.textField.rx.text, didNextButtonTap: self.passwordView.nextButton.rx.tap.withLatestFrom(self.passwordView.passwordLineTextField.textField.rx.text.orEmpty).asSignal(onErrorJustReturn: ""))
    //MARK: Output

    //MARK: Delegate
    init(viewModel: PasswordViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("PasswordViewController: fatal error")
    }
    
    override func loadView() {
        self.view = passwordView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
    }
    
    override func setupBinding() {
        let output = viewModel.transform(input)
        
        output.pwValidation.withUnretained(self)
            .bind { vc, valid in
                
                let textColor: UIColor = valid ? .systemBlue : .systemRed
                vc.passwordView.passwordValidLabel.textColor = textColor
                
                let str: String = valid ?
                ValidationString.passwordFormatSuccess.text : ValidationString.passwordFormat.text
                
                vc.passwordView.passwordValidLabel.text = str

            }
            .disposed(by: disposeBag)
        
        output.signUpValidation.withUnretained(self)
            .bind { vc, valid in
                let buttonColor: UIColor = valid ?
                Color.BaseColor.hunt2 : Color.BaseColor.gray6
                vc.passwordView.nextButton.backgroundColor = buttonColor
                
                let textColor: UIColor = valid ? .systemBlue : .systemRed
                vc.passwordView.checkPasswordValidLabel.textColor = textColor
                
                let str: String = valid ?
                ValidationString.samePW.text : ValidationString.notSamePW.text
                
                vc.passwordView.checkPasswordValidLabel.text = str

            }
            .disposed(by: disposeBag)
        
        output.requestTextMessage.emit(onNext: {[unowned self] text in self.view.makeToast(text, position: .bottom)})
            .disposed(by: disposeBag)
    }
}
