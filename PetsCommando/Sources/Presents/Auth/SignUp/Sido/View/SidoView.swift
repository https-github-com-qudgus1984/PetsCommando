//
//  SidoView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/19.
//

import UIKit
import SnapKit

final class SidoView: BaseView {
    
    private var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.BaseColor.hunt4
        return view
    }()
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: categoryLayout())
    

    override func setupAttributes() {
        self.addSubview(bgView)
        self.addSubview(collectionView)
    }
    
    override func setupLayout() {
        
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(bgView)
        }
    }
    
    private func categoryLayout() -> UICollectionViewLayout {
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        let collectionViewLayout = UICollectionViewCompositionalLayout(
            sectionProvider:
                { sectionIndex, layoutEnvironment in
                    return self.dynamicCategoryLayout()
                },
            configuration: configuration)
        return collectionViewLayout

    }
}

extension SidoView {
    private func dynamicCategoryLayout() -> NSCollectionLayoutSection {
            //item
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .estimated(200),
                heightDimension: .absolute(40)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            //group
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(40)
            )
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                subitems: [item]
            )
            group.interItemSpacing = .fixed(8)
    
            //sections
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 16
            section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
            
            return section
        }
}
