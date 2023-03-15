//
//  CustomTabBarView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/14.
//
import UIKit

final class CustomTabManView: BaseView {
    private let tapBarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 30)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    private let pageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 390, height: 600)
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()

    private let highlightView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
}
