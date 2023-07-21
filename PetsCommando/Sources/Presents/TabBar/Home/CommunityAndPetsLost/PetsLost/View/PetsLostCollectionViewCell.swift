//
//  PetsLostCollectionViewCell.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/07.
//

import UIKit
import SnapKit

class PetsLostCollectionViewCell: BaseCollectionViewCell {
    static let identifier = "PetsLostCollectionViewCell"

    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.clipsToBounds = true
        return view
    }()
    
    let insetbgView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    let speciesLabel: UILabel = {
        let view = UILabel()
        view.font = Font.Title2_B16
        view.text = "포메라니안"
        return view
    }()
    
    let genderLabel: UILabel = {
        let view = UILabel()
        view.font = Font.Body2_L16
        view.text = "여"

        return view
    }()
    
    let characteristicLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = Font.Body2_L16
        view.text = "특징 : 장난많음"
        return view
    }()
    
    let shelterLabel: UILabel = {
        let view = UILabel()
        view.font = Font.Body2_L16
        view.text = "서울시 유기견센터"

        return view
    }()

    let euthanasiaLabel: UILabel = {
        let view = UILabel()
        view.font = Font.Body2_L16
        view.text = "안락사 예정일 : 2023.01.01"

        return view
    }()
    
    let imgView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .label
        view.image = UIImage(systemName: "person.fill")
        view.clipsToBounds = true
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.layer.cornerRadius = 8
        insetbgView.layer.cornerRadius = 8
        imgView.layer.cornerRadius = 8
    }
        
    override func configure() {
        [bgView, insetbgView, imgView, speciesLabel, genderLabel, shelterLabel, euthanasiaLabel, characteristicLabel].forEach { self.addSubview($0) }
    }
    
    override func setConstraints() {
        
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
        
        insetbgView.snp.makeConstraints { make in
            make.edges.equalTo(bgView).inset(1)
        }
        
        imgView.snp.makeConstraints { make in
            make.top.bottom.equalTo(insetbgView).inset(40)
            make.leading.equalToSuperview().inset(20)
            make.width.equalTo(imgView.snp.height)
        }
        
        speciesLabel.snp.makeConstraints { make in
            make.leading.equalTo(imgView.snp.trailing).offset(8)
            make.top.equalTo(imgView.snp.top)
            make.trailing.equalTo(insetbgView)
            make.height.equalTo(20)
        }
        
        genderLabel.snp.makeConstraints { make in
            make.leading.equalTo(imgView.snp.trailing).offset(8)
            make.top.equalTo(speciesLabel.snp.bottom).offset(2)
            make.trailing.equalTo(insetbgView)
            make.height.equalTo(15)
        }
        
        euthanasiaLabel.snp.makeConstraints { make in
            make.leading.equalTo(imgView.snp.trailing).offset(8)
            make.bottom.equalTo(imgView.snp.bottom)
            make.trailing.equalTo(insetbgView)
            make.height.equalTo(20)
        }
        
        shelterLabel.snp.makeConstraints { make in
            make.leading.equalTo(imgView.snp.trailing).offset(8)
            make.bottom.equalTo(euthanasiaLabel.snp.top).offset(-2)
            make.trailing.equalTo(insetbgView)
            make.height.equalTo(20)
        }
        
        characteristicLabel.snp.makeConstraints { make in
            make.leading.equalTo(imgView.snp.trailing).offset(8)
            make.top.equalTo(genderLabel.snp.bottom).offset(2)
            make.trailing.equalTo(insetbgView)
            make.bottom.equalTo(euthanasiaLabel.snp.top)
        }
    }
}
