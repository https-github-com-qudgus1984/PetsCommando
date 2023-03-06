//
//  InitialViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/06.
//

import UIKit

class InitialViewController: BaseViewController {
    
    let mainView = InitialView()

    //MARK: Delegate
    weak var coordinator: InitialCoordinator?
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
