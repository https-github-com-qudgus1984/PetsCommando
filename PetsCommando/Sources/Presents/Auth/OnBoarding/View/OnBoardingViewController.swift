//
//  LaunchScreenViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/04.
//

import UIKit
import RxSwift
import RxCocoa

class OnBoardingViewController: BaseViewController {
    
    let onBoardingView = OnBoardingView()

    //MARK: Delegate
    private var viewModel: OnBoardingViewModel

    required init?(coder aDecoder: NSCoder) {
        fatalError("GenderViewController: fatal error")
    }
    
    init(viewModel: OnBoardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = onBoardingView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setupBinding() {

        onBoardingView.startButton.rx.tap
            .bind { [weak self] in
                guard let self = self else { return }
//                self.coordinator?.rootViewControllerChangedLoginViewController()
                self.viewModel.showLoginController()
            }
            .disposed(by: disposeBag)
    }
}
