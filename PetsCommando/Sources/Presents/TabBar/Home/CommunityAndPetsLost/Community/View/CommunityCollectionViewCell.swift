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

    let titleLabel: UILabel = {
        let view = UILabel()
        view.font = Font.Title2_B16
        view.text = "시간 / 잃어버린 장소 / 이름"
        return view
    }()
    
    let locationLabel: UILabel = {
        let view = UILabel()
        view.font = Font.Body2_L16
        view.text = "서울시 동작구"

        return view
    }()
    
    let gratuityLabel: UILabel = {
        let view = UILabel()
        view.font = Font.Body2_L16
        view.text = "사례금 : 50000원"

        return view
    }()

    let imgView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .label
        view.image = UIImage(systemName: "person.fill")

        return view
    }()
    
        
    override func configure() {
        [imgView, titleLabel, locationLabel, gratuityLabel].forEach { self.addSubview($0) }
    }
    
    override func setConstraints() {
        imgView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview().inset(8)
            make.width.equalTo(imgView.snp.height)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(imgView.snp.trailing).offset(8)
            make.top.equalTo(imgView.snp.top)
            make.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.leading.equalTo(imgView.snp.trailing).offset(8)
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.trailing.equalToSuperview()
            make.height.equalTo(15)
        }
        
        gratuityLabel.snp.makeConstraints { make in
            make.leading.equalTo(imgView.snp.trailing).offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.trailing.equalToSuperview()
            make.height.equalTo(20)

        }
    }
}
