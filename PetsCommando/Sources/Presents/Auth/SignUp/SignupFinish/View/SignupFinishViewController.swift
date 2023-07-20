//
//  SignupFinishViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/20.
//

import UIKit
import RxSwift
import RxCocoa

class SignupFinishViewController: BaseViewController {
    
    let selfView = SignupFinishView()

    //MARK: Delegate
    private var viewModel: SignupFinishViewModel

    required init?(coder aDecoder: NSCoder) {
        fatalError("GenderViewController: fatal error")
    }
    
    init(viewModel: SignupFinishViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = selfView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setupBinding() {

        selfView.startButton.rx.tap
            .bind { [weak self] in
                guard let self = self else { return }
                self.viewModel.showLoginController()
            }
            .disposed(by: disposeBag)
    }
}
