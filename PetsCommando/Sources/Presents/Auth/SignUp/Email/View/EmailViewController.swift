//
//  EmailViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/25.
//

import UIKit
import RxSwift
import RxCocoa
import Toast

final class EmailViewController: BaseViewController {
    private let emailView = EmailView()
    private let viewModel: EmailViewModel
    
    //MARK: Input
    private lazy var input = EmailViewModel.Input(
        emailText: self.emailView.emailLineTextField.textField.rx.text, certificaionButtonTap: self.emailView.emailCertificationButton.rx.tap.withLatestFrom(self.emailView.emailLineTextField.textField.rx.text.orEmpty)
            .asSignal(onErrorJustReturn: "")
        , didNextButtonTap:  self.emailView.nextButton.rx.tap.withLatestFrom(self.emailView.emailLineTextField.textField.rx.text.orEmpty)
            .asSignal(onErrorJustReturn: "")
    )
    
    //MARK: Output
    private lazy var output = self.viewModel.transform(input)
    
    //MARK: Delegate
    init(viewModel: EmailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("EmailViewController: fatal error")
    }
    
    override func loadView() {
        self.view = emailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
    }
    
    override func setupBinding() {
        
        //MARK: email 양식에 맞을 때
        output.emailValidation
            .withUnretained(self)
            .bind { vc, valid in
                // valid에 따른 버튼 색 변경
                let buttonColor: UIColor = valid ? Color.BaseColor.hunt2 : Color.BaseColor.gray6
                vc.emailView.emailCertificationButton.backgroundColor = buttonColor
                
                // valid에 따른 버튼 활성화
                vc.emailView.emailCertificationButton.isEnabled = valid
            }
            .disposed(by: disposeBag)
        
        output.emailduplicationValidation
            .withUnretained(self)
            .bind { vc, valid in
                let str: String = valid ?
                ValidationString.successAuth.text : ValidationString.duplicateInspectionEmail.text
                vc.emailView.emailValidLabel.text = str
                
                let textColor: UIColor = valid ? .systemBlue : .systemRed
                vc.emailView.emailValidLabel.textColor = textColor
                vc.emailView.nextButton.isEnabled = valid

                
            }
            .disposed(by: disposeBag)
        
        output.totalValidation.withUnretained(self)
            .bind { vc, valid in
                let buttonColor: UIColor = valid ? Color.BaseColor.hunt2 : Color.BaseColor.gray6
                vc.emailView.nextButton.backgroundColor = buttonColor
            }
            .disposed(by: disposeBag)
        
        output.requestTextMessage.emit(onNext: {[unowned self] text in self.view.makeToast(text, position: .top)})
            .disposed(by: disposeBag)
        
    }
}

