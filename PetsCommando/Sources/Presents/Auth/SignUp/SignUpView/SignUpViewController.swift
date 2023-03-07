//
//  SignUpViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/06.
//

import UIKit
import SnapKit


final class SignUpViewController: BaseViewController {
    
    //MARK: Delegate
//    weak var coordinator: SignUpCoordinator?
    
    override func loadView() {
        super.view = SignUpView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
