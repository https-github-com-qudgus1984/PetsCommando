//
//  SidoCollectionViewCell.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/19.
//

import UIKit
import SnapKit

class SidoCollectionViewCell: BaseCollectionViewCell {
    static let identifier = "SidoCollectionViewCell"

    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()
    
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        label.textColor = .black
        label.textAlignment = .center
        label.text = "서울특별시"
        return label
    }()
    

    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.layer.cornerRadius = 8
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = Color.BaseColor.hunt3.cgColor
    }
        
    override func configure() {
        [bgView, categoryLabel].forEach { self.addSubview($0) }
    }
    
    override func setConstraints() {
        
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(bgView.snp.horizontalEdges).inset(8)
            make.verticalEdges.equalTo(bgView.snp.verticalEdges).inset(4)
        }
    }
}
