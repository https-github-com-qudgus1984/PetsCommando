//
//  PasswordViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/25.
//

import UIKit
import RxSwift
import RxCocoa

final class PasswordViewController: BaseViewController {
    private let passwordView = PasswordView()
    private let viewModel: PasswordViewModel
    


    //MARK: Delegate
    init(viewModel: PasswordViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("PasswordViewController: fatal error")
    }
    
    override func loadView() {
        self.view = passwordView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setupBinding() {
                
    }
}
