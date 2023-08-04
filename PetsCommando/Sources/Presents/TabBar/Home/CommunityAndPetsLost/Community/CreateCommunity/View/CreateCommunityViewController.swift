//
//  CreateCommunityViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/28.
//

import UIKit
import RxSwift
import RxCocoa

final class CreateCommunityViewController: BaseViewController {
    
    let createCommunityView = CreateCommunityView()
    let viewModel: CreateCommunityViewModel
    
    //MARK: Delegate
    init(viewModel: CreateCommunityViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        self.navigationController?.navigationBar.scrollEdgeAppearance?.backgroundColor = Color.BaseColor.hunt4
    }
    
    override func loadView() {
        self.view = createCommunityView
    }
    
    override func setupBinding() {
        let input = CreateCommunityViewModel.Input(titleText: self.createCommunityView.titleTextField.rx.text, contentText: self.createCommunityView.textView.rx.text, registerButtonTap: self.createCommunityView.registerButton.rx.controlEvent(.touchUpInside)
            .map {
                DailyPostQuery(title: self.createCommunityView.titleTextField.text!, content: self.createCommunityView.textView.text!)
            }
        )
        
        let output = viewModel.transform(input)
        
        output.postValid
            .withUnretained(self)
            .bind { vc, valid in
                print(valid)
                let buttonColor: UIColor = valid ? Color.BaseColor.hunt2 : Color.BaseColor.gray6
                vc.createCommunityView.registerContainView.backgroundColor = buttonColor
                vc.createCommunityView.registerButton
                    .isEnabled = valid
            }
            .disposed(by: disposeBag)
    }
}
