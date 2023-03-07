//
//  LaunchScreenViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/04.
//

import UIKit

class OnBoardingViewController: BaseViewController {
    
    let mainView = OnBoardingView()

    //MARK: Delegate
    weak var coordinator: OnBoardingCoordinator?
    
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setupBinding() {
        mainView.startButton.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
    }
    
    @objc
    func startButtonClicked() {
        self.coordinator?.rootViewControllerChangedLoginViewController()
    }
}
