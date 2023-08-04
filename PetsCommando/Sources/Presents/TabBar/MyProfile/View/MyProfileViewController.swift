//
//  MyProfileViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/21.
//

import UIKit
import RxSwift
import RxCocoa

final class MyProfileViewController: BaseViewController {
    let selfView = MyProfileView()
    
    private let viewModel: MyProfileViewModel
    
    init(viewModel: MyProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = selfView
    }
    
    let locationUpdate = PublishRelay<Void>()
    
    override func setupBinding() {
        let input = MyProfileViewModel.Input(nicknameModifyButtonTap: self.selfView.nicknameModifyButton.rx.tap, locationModifyButtonTap: self.selfView.locationModifyButton.rx.tap)
        let output = viewModel.transform(input)
        
        NotificationCenter.default.addObserver(self, selector: #selector(sendLocationUpdate(_:)), name: NSNotification.Name("location"), object: nil)
        
        self.locationUpdate
            .withUnretained(self)
            .observe(on: MainScheduler.instance)
            .bind { vc, _ in
                vc.selfView.locationExplainLabel.text = "\(UserDefaults.standard.string(forKey: "sido") ?? "미설정") \(UserDefaults.standard.string(forKey: "sigungu") ?? "")"
            }
            .disposed(by: disposeBag)
    }
}

extension MyProfileViewController {
    @objc
    func sendLocationUpdate(_ notification: Notification) {
        self.locationUpdate.accept(())
    }
}
