//
//  LaunchScreenViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/04.
//

import UIKit

class CertificationViewController: BaseViewController {
    
    //MARK: Delegate
    weak var coordinator: CertificationCoordinator?
    
    override func loadView() {
        super.view = CertificationView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
