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
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 8)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    internal var searchButton: CircleButton = {
       let button = CircleButton()
        button.setValidStatus(status: Status.search)
        button.setConfiguration()
        return button
    }()
    
    internal var plusButton: CircleButton = {
       let button = CircleButton()
        button.setValidStatus(status: Status.plus)
        button.setConfiguration()
        return button
    }()
    
    internal var findLostStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 1
        view.clipsToBounds = true
        view.layer.cornerRadius = view.bounds.width / 2
        return view
    }()
    
    
    internal var findButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = Color.BaseColor.hunt3
        button.setTitle("발견", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    internal var lostButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = Color.BaseColor.hunt3
        button.setTitle("분실", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func configureUI() {
        [collectionView].forEach {
            self.addSubview($0)
        }
        
        [searchButton, plusButton, findLostStackView].forEach {
            addSubview($0)
        }
        
        [findButton, lostButton].forEach { self.findLostStackView.addArrangedSubview($0) }

    }
    
    override func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        
        findLostStackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(100)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(80)
            make.width.equalTo(40)
        }
        
        plusButton.snp.makeConstraints { make in
            make.bottom.equalTo(findLostStackView.snp.top).offset(-20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.width.equalTo(40)
        }
        
        searchButton.snp.makeConstraints { make in
            make.bottom.equalTo(plusButton.snp.top).offset(-20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.width.equalTo(40)
        }
    }
}
