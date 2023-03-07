//
//  SignUpViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/06.
//

import UIKit
import SnapKit


final class SignUpViewController: BaseViewController {
    
    let mainView = SignUpView()
    //MARK: Delegate
    weak var coordinator: SignUpCoordinator?
    
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("3")
    }
}
