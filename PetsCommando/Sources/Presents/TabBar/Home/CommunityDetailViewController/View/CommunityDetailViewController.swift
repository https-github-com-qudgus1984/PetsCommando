//
//  CommunityDetailViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/10.
//

import UIKit

final class CommunityDetailViewController: BaseViewController {
    let communityView = CommunityDetailView()
    
    override func loadView() {
        self.view = communityView
    }
}
