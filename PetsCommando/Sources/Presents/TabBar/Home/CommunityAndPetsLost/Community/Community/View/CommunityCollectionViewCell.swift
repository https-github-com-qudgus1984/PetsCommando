//
//  CommunityCollectionViewCell.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/07.
//

import UIKit
import SnapKit

class CommunityCollectionViewCell: BaseCollectionViewCell {
    static let identifier = "CommunityCollectionViewCell"
    
    let bgView: UIView = {
        let view = UIView()
        return view
    }()

    let titleLabel: UILabel = {
        let view = UILabel()
        view.font = Font.Title2_B16
        view.text = "제목제목"
        return view
    }()
    
    let registerTimeLabel: UILabel = {
        let view = UILabel()
        view.font = Font.Body2_L16
        view.text = "몇시 몇분 몇초"

        return view
    }()
    
    let contentLabel: UILabel = {
        let view = UILabel()
        view.font = Font.Body2_L16
        view.text = "내용내용내용내용"
        view.numberOfLines = 0
        return view
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = UIColor.black.cgColor
        bgView.layer.cornerRadius = 8
    }
        
    override func configure() {
        [bgView, titleLabel, registerTimeLabel, contentLabel].forEach { self.addSubview($0) }
    }
    
    override func setConstraints() {
        
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(bgView).inset(8)
            make.top.equalTo(bgView.snp.top)
            make.height.equalTo(20)
        }
        
        registerTimeLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(bgView).inset(8)
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.height.equalTo(15)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(bgView).inset(8)
            make.bottom.equalTo(bgView)
            make.top.equalTo(registerTimeLabel.snp.bottom).offset(8)

        }
    }
}
