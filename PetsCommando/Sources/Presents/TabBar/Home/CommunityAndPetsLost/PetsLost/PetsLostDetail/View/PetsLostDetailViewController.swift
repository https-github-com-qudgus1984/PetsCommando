//
//  CommunityDetailViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/10.
//

import UIKit
import RxSwift
import RxCocoa

final class PetsLostDetailViewController: BaseViewController {
    private let selfView = PetsLostDetailView()
    private let viewModel: PetsLostDetailViewModel
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("CommunityDetailViewController: fatal error")
    }
    
    //MARK: Delegate
    init(viewModel: PetsLostDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = selfView
    }
}
