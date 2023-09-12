//
//  CommunityDetailView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/28.
//

import UIKit
import SnapKit
import Kingfisher

final class CommunityDetailView: BaseView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title1_B20
        label.textAlignment = .center
        label.text = "제목"
        return label
    }()
    
    let imageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    let contentLabel: VerticalAlignLabel = {
        let label = VerticalAlignLabel()
        label.font = Font.Body2_L16
        label.text = "내용"
        label.numberOfLines = 0
        label.verticalAlignment = .top
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
        self.addSubview(imageView)
        self.addSubview(contentLabel)
    }
    
    override func layoutSubviews() {
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
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.width.equalTo(safeAreaLayoutGuide).inset(44)
            make.height.equalTo(imageView.snp.width)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(12)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.bottom.greaterThanOrEqualTo(safeAreaLayoutGuide)
        }
    }
}

extension CommunityDetailView {
    func configureItem(item: DetailDailyPost) {
        guard let url = item.photourl else {
            contentLabel.snp.removeConstraints()
            contentLabel.snp.remakeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(12)
                make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
                make.bottom.greaterThanOrEqualTo(safeAreaLayoutGuide)
            }
            return
        }
        if item.photourl == nil {
            contentLabel.snp.removeConstraints()
            contentLabel.snp.remakeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(12)
                make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
                make.bottom.greaterThanOrEqualTo(safeAreaLayoutGuide)
            }
        } else {
            let imageURL = URL(string: "http://\(url)")
            imageView.kf.setImage(with: imageURL)
        }
    }
}
