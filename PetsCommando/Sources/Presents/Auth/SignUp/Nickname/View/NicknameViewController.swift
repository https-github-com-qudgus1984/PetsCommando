//
//  NicknameViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/25.
//

import UIKit
import RxSwift
import RxCocoa

final class NicknameViewController: BaseViewController {
    private let nicknameView = NicknameView()
    private let viewModel: NicknameViewModel
    //MARK: Delegate
    init(viewModel: NicknameViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("GenderViewController: fatal error")
    }
    
    override func loadView() {
        self.view = nicknameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setupBinding() {
        let input = NicknameViewModel.Input(nicknameText: nicknameView.nicknameLineTextField.textField.rx.text)
        
        let output = viewModel.transform(input)
        
        output.nicknameValidation
            .withUnretained(self)
            .bind { vc, valid in
                let buttonColor: UIColor = valid ? Color.BaseColor.hunt2 : Color.BaseColor.gray6
                vc.nicknameView.nicknameCertificationButton.backgroundColor = buttonColor
            }
            .disposed(by: disposeBag)
        
        output.nicknameValidation
            .withUnretained(self)
            .bind { vc, valid in
                let str: String = valid ?
                ValidationString.successAuth.text : ValidationString.duplicateInspectionEmail.text
                vc.nicknameView.nicknameValidLabel.text = str
                let textColor: UIColor = valid ? .systemBlue : .systemRed
                vc.nicknameView.nicknameValidLabel.textColor = textColor

            }
            .disposed(by: disposeBag)
    }
}
