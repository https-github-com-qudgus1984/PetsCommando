//
//  CommunityDetailViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/28.
//

import UIKit
import RxSwift
import RxCocoa

final class CommunityDetailViewController: BaseViewController, UICollectionViewDelegate {
    
    let communityDetailView = CommunityDetailView()
    let viewModel: CommunityDetailViewModel
    
    //MARK: Delegate
    init(viewModel: CommunityDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    let viewDidLoadTrigger = PublishRelay<Void>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewDidLoadTrigger.accept(())
    }
    
    override func loadView() {
        self.view = communityDetailView
    }
    
    override func setupBinding() {
        let input = CommunityDetailViewModel.Input(viewDidLoad: self.viewDidLoadTrigger, reviewButtonTap: communityDetailView.reviewPlusButton.rx.tap)
        let output = viewModel.transform(input)
        
        output.post
            .observe(on: MainScheduler.instance)
            .withUnretained(self)
            .bind { vc, post in
                vc.communityDetailView.titleLabel.text = post.title
                vc.communityDetailView.contentLabel.text = post.content
            }
            .disposed(by: disposeBag)
    }
}
