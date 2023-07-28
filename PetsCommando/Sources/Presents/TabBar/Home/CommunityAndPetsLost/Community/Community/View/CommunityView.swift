//
//  CummunityView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/06.
//

import UIKit
import SnapKit

final class CommunityView: BaseView {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 16, height: UIScreen.main.bounds.height / 8)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    internal var plusButton: CircleButton = {
       let button = CircleButton()
        button.setValidStatus(status: Status.plus)
        button.setConfiguration()
        return button
    }()
    
    override func configureUI() {
        [collectionView].forEach {
            self.addSubview($0)
        }
        self.addSubview(plusButton)
        

    }
    
    override func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        
        plusButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.width.equalTo(40)
        }
    }
}
