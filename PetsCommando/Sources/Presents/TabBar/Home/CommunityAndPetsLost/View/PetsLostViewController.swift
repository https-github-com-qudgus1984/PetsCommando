//
//  PetsListViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/07.
//

import UIKit

final class PetsLostViewController: BaseViewController {
    
    let petsLostView = PetsLostView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = petsLostView
    }
}
