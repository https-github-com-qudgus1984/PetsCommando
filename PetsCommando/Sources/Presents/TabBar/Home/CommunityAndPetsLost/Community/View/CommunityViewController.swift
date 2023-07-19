//
//  CommunityViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/07.
//

import UIKit
import RxSwift
import RxCocoa

final class CommunityViewController: BaseViewController, UICollectionViewDelegate {
    
    let communityView = CommunityView()
    let viewModel: CommunityViewModel
    
    //MARK: Delegate
    init(viewModel: CommunityViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    let cellSelected = PublishSubject<Void>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        communityView.collectionView.register(CommunityCollectionViewCell.self, forCellWithReuseIdentifier: CommunityCollectionViewCell.identifier)

        communityView.collectionView.delegate = self
        communityView.collectionView.dataSource = self

    }
    
    override func loadView() {
        self.view = communityView
    }
    
    override func setupBinding() {
        let input = CommunityViewModel.Input(cellSelected: self.cellSelected)
        let _ = viewModel.transform(input)
    }
}

extension CommunityViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommunityCollectionViewCell.identifier, for: indexPath) as! CommunityCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("이건찍히지")
        self.cellSelected.onNext(())
    }
}

