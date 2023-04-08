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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        communityView.collectionView.register(CommunityCollectionViewCell.self, forCellWithReuseIdentifier: CommunityCollectionViewCell.identifier)

        communityView.collectionView.delegate = self
        communityView.collectionView.dataSource = self

    }
    
    override func loadView() {
        self.view = communityView
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
}

