//
//  TabManViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/14.
//

import UIKit

class CustomTabBarView: UIView {

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()

    // 탭바 아이템의 정보를 저장하는 배열
    var items: [CustomTabBarItem] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        collectionView.dataSource = self
        collectionView.delegate = self

        // collectionView에 셀을 등록합니다.
        collectionView.register(CustomTabBarCell.self, forCellWithReuseIdentifier: "CustomTabBarCell")

        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

extension CustomTabBarView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomTabBarCell", for: indexPath) as! CustomTabBarCell
        cell.item = items[indexPath.item]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = frame.width / CGFloat(items.count)
        let height = frame.height
        return CGSize(width: width, height: height)
    }
}
