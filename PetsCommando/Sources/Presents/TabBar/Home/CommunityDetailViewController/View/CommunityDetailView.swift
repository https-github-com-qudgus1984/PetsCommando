//
//  CommunityDetailView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/10.
//

import UIKit

final class CommunityDetailView: BaseView {
    let titleLabel: UILabel = {
        let view = UILabel()
        view.font = Font.Title2_B16
        view.text = "시간 / 잃어버린 장소 / 이름"
        return view
    }()
    
    let gratuityLabel: UILabel = {
        let view = UILabel()
        view.font = Font.Body2_L16
        view.text = "사례금 : 50000원"

        return view
    }()
    
    lazy var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    let indicatorView: IndicatorView = {
        let indicatorView = IndicatorView()
        return indicatorView
    }()
    
    let mainTextLabel: UILabel = {
        let view = UILabel()
        view.font = Font.Body2_L16
        view.text = "본문입니다@@@@@@@@@@@@@@@@@@@@"
        view.numberOfLines = 0
        return view
    }()
    
    lazy var commentCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override func configureUI() {
        [titleLabel, gratuityLabel, photoCollectionView, indicatorView, mainTextLabel, commentCollectionView].forEach {
            addSubview($0)
        }
    }
    
    override func setupLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.centerX.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(20)
        }
        gratuityLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.centerX.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(20)
        }
        
        photoCollectionView.snp.makeConstraints { make in
            make.top.equalTo(gratuityLabel.snp.bottom)
            make.centerX.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(photoCollectionView.snp.width)
        }
        
        indicatorView.snp.makeConstraints { make in
            make.top.equalTo(photoCollectionView.snp.bottom).offset(4)
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(8)
        }
        
        commentCollectionView.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(UIScreen.main.bounds.height / 10)
        }
        
        mainTextLabel.snp.makeConstraints { make in
            make.top.equalTo(indicatorView.snp.bottom).offset(8)
            make.bottom.equalTo(commentCollectionView.snp.top).offset(8)
            make.centerX.equalTo(safeAreaLayoutGuide).inset(20)
        }
    }
}

