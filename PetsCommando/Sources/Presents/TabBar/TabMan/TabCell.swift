//
//  TabCell.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/15.
//

import UIKit
import SnapKit

class TabCell: UICollectionViewCell {
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
       return label
    }()
    var lineView: UIView = {
        let view = UIView()
        view.tintColor = Color.BaseColor.gray3
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        contentView.addSubview(lineView)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(44)
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
    }
    
}
