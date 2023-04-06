//
//  CommunityTableCell.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/06.
//

import UIKit
import SnapKit

class CommunitryTableViewCell: BaseTableViewCell {
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return view
    }()
    
    let locationLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return view
    }()
    
    let gratuityLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return view
    }()

    let imgView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .label
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
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.trailing.equalToSuperview()
            make.height.equalTo(15)
        }
        
        gratuityLabel.snp.makeConstraints { make in
            make.leading.equalTo(imgView.snp.trailing).offset(8)
            make.bottom.equalToSuperview().offset(8)
            make.trailing.equalToSuperview()
            make.height.equalTo(20)

        }
    }
    
    func configureCell(itemIdentifier: MockListData) {
        
        titleLabel.text = data.title
        locationLabel.text = data.location
        gratuityLabel.text = data.gratuity == nil ? "" : "\(String(describing: data.gratuity))원"
        imgView.image = data.petImg == nil ? nil : UIImage(named: "")
    }
}

let data = MockListData(title: "ㅎㅇㅎㅇ", location: "문래동", gratuity: 40000, petImg: nil)
