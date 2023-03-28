//
//  EmailViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/25.
//

import UIKit
import RxSwift
import RxCocoa

final class EmailViewController: BaseViewController {
    private let emailView = EmailView()
    private let viewModel: EmailViewModel
    //MARK: Delegate
    init(viewModel: EmailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("GenderViewController: fatal error")
    }
    
    override func loadView() {
        self.view = emailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setupBinding() {
        let input = EmailViewModel.Input(emailText: emailView.emailLineTextField.textField.rx.text)
        
        let output = viewModel.transform(input)
        
        output.emailValidation
            .withUnretained(self)
            .bind { vc, valid in
                let buttonColor: UIColor = valid ? Color.BaseColor.hunt2 : Color.BaseColor.gray6
                vc.emailView.emailCertificationButton.backgroundColor = buttonColor
            }
            .disposed(by: disposeBag)
        
        output.emailValidation
            .withUnretained(self)
            .bind { vc, valid in
                let str: String = valid ?
                ValidationString.successAuth.text : ValidationString.duplicateInspectionEmail.text
                vc.emailView.emailValidLabel.text = str
                let textColor: UIColor = valid ? .systemBlue : .systemRed
                vc.emailView.emailValidLabel.textColor = textColor

            }
            .disposed(by: disposeBag)
        
        emailView.emailCertificationButton.rx.tap
            .withUnretained(self)
            .bind { vc, tapped in
                self.viewModel.startDuplicationEmail(email: DuplicationEmailQuery(email: self.emailView.emailLineTextField.textField.text!))
            }
        
    }
}
