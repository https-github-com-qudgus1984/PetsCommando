//
//  CommunityViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/07.
//

import UIKit

final class CommunityViewController: BaseViewController {
    
    let communityView = CommunitryView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = communityView
    }
}
