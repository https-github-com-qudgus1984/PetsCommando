//
//  SidoView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/19.
//

import UIKit
import SnapKit

final class SidoView: BaseView {
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: categoryLayout())

    override func setupAttributes() {
        self.addSubview(collectionView)
    }
    
    override func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
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
                heightDimension: .absolute(32)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            //group
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(32)
            )
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                subitems: [item]
            )
            group.interItemSpacing = .fixed(8)
            //sections
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 0
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 0)
            
            return section
        }
}
