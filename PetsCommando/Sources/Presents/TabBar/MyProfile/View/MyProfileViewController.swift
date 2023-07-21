//
//  MyProfileViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/21.
//

import UIKit
import RxSwift
import RxCocoa

final class MyProfileViewController: BaseViewController {
    let selfView = MyProfileView()
    private let viewModel: MyProfileViewModel
    
    init(viewModel: MyProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = selfView
    }
    
    override func setupBinding() {
        let input = MyProfileViewModel.Input(nicknameModifyButtonTap: self.selfView.nicknameModifyButton.rx.tap, locationModifyButtonTap: self.selfView.locationModifyButton.rx.tap)
        let output = viewModel.transform(input)
    }
}
