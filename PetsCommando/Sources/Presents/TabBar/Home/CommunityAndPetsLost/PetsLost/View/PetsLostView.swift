//
//  PetsLostView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/06.
//

import UIKit
import SnapKit

final class PetsLostView: BaseView {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 5)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override func configureUI() {
        [collectionView].forEach {
            self.addSubview($0)
        }
    }
    
    override func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
}
