//
//  BaseCollectionViewCell.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/18.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
        layer.cornerRadius = 8
        layer.masksToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure() { }
    func setConstraints() { }
    
}
