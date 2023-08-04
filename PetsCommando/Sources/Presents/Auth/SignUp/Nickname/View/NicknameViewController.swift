//
//  NicknameViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/25.
//

import UIKit
import RxSwift
import RxCocoa
import Toast

final class NicknameViewController: BaseViewController {
    private let nicknameView = NicknameView()
    private let viewModel: NicknameViewModel
    
    //MARK: Input
    private lazy var input = NicknameViewModel.Input(nicknameText: self.nicknameView.nicknameLineTextField.textField.rx.text, didNextButtonTap: self.nicknameView.nextButton.rx.tap.withLatestFrom(self.nicknameView.nicknameLineTextField.textField.rx.text.orEmpty)
        .asSignal(onErrorJustReturn: ""), certificationButtonTap: self.nicknameView.nicknameCertificationButton.rx.tap.withLatestFrom(self.nicknameView.nicknameLineTextField.textField.rx.text.orEmpty)
        .asSignal(onErrorJustReturn: ""))
    //MARK: Output

    
    //MARK: Delegate
    init(viewModel: NicknameViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NicknameViewController: fatal error")
    }
    
    override func loadView() {
        self.view = nicknameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
    }
    
    override func setupBinding() {
        
        let output = viewModel.transform(input)
        
        output.nicknameValidation
            .withUnretained(self)
            .bind { vc, valid in
                let buttonColor: UIColor = valid ? Color.BaseColor.hunt2 : Color.BaseColor.gray6
                vc.nicknameView.nicknameCertificationButton.backgroundColor = buttonColor
                vc.nicknameView.nicknameCertificationButton.isEnabled = valid

            }
            .disposed(by: disposeBag)
        
        output.nicknameduplicationValidation
            .withUnretained(self)
            .bind { vc, valid in
                let str: String = valid ?
                ValidationString.successAuth.text : ValidationString.duplicateInspectionNickname.text
                vc.nicknameView.nicknameValidLabel.text = str
                let textColor: UIColor = valid ? .systemBlue : .systemRed
                vc.nicknameView.nicknameValidLabel.textColor = textColor
                vc.nicknameView.nextButton.isEnabled = valid


            }
            .disposed(by: disposeBag)
        
        output.totalValidation.withUnretained(self)
            .bind { vc, valid in
                let buttonColor: UIColor = valid ? Color.BaseColor.hunt2 : Color.BaseColor.gray6
                vc.nicknameView.nextButton.backgroundColor = buttonColor
                vc.nicknameView.nextButton.isEnabled = valid
            }
            .disposed(by: disposeBag)
        
        output.requestTextMessage.emit(onNext: {[unowned self] text in self.view.makeToast(text, position: .bottom)})
            .disposed(by: disposeBag)
    }
}
