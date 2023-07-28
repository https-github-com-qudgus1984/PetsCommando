//
//  CommunityDetailView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/28.
//

import UIKit
import SnapKit

final class CommunityDetailView: BaseView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title1_B20
        label.textAlignment = .center
        label.text = "제목"
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        label.text = "내용"
        label.numberOfLines = 0
        return label
    }()
    
    let reviewMoreLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        label.text = "댓글 보기"
        label.textAlignment = .center
        return label
    }()
    
    let reviewPlusButton: UIButton = {
       let button = UIButton()
        return button
    }()
    
    override func setupAttributes() {
        self.addSubview(reviewMoreLabel)
        self.addSubview(reviewPlusButton)
        self.addSubview(titleLabel)
        self.addSubview(contentLabel)
    }
    
    override func setupLayout() {
        
        
        reviewMoreLabel.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
            make.width.equalTo(80)
        }
        
        reviewPlusButton.snp.makeConstraints { make in
            make.edges.equalTo(reviewMoreLabel)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(36)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(44)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(36)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
