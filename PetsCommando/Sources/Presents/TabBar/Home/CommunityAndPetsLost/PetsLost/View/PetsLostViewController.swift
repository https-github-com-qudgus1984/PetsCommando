//
//  PetsListViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/07.
//

import UIKit
import RxSwift
import RxCocoa

final class PetsLostViewController: BaseViewController, UICollectionViewDelegate {
    
    let petsLostView = PetsLostView()

    override func viewDidLoad() {
        super.viewDidLoad()
        petsLostView.collectionView.register(PetsLostCollectionViewCell.self, forCellWithReuseIdentifier: PetsLostCollectionViewCell.identifier)

        petsLostView.collectionView.delegate = self
        petsLostView.collectionView.dataSource = self

    }
    
    override func loadView() {
        self.view = petsLostView
    }
}

extension PetsLostViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetsLostCollectionViewCell.identifier, for: indexPath) as! PetsLostCollectionViewCell
        
        return cell
    }
}

