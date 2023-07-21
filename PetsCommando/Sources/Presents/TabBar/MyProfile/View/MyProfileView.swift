//
//  MyProfileView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/21.
//

import UIKit
import SnapKit

final class MyProfileView: BaseView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title1_B20
        label.textAlignment = .left
        label.text = "나의 프로필"
        return label
    }()
    
    let nicknameLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title1_B20
        label.textAlignment = .center
        label.text = "익명"
        return label
    }()
    
    let nicknameModifyButton: UIButton = {
        let button = UIButton()
        button.setTitle("수정", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = Color.BaseColor.hunt3.cgColor
        return button
    }()
     
    let locationContainView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    let locationTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title1_B20
        label.text = "나의 지역구"
        return label
    }()
    
    let locationModifyButton: UIButton = {
        let button = UIButton()
        button.setTitle("수정", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = Color.BaseColor.hunt3.cgColor
        return button
    }()
    
    let locationExplainLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        label.text = "\(UserDefaults.standard.string(forKey: "sido") ?? "미설정") \(UserDefaults.standard.string(forKey: "sigungu") ?? "")"
        return label
    }()
    
    override func setupAttributes() {
        self.addSubview(titleLabel)
        self.addSubview(nicknameLabel)
        self.addSubview(nicknameModifyButton)
        self.addSubview(locationContainView)
        self.addSubview(locationTitleLabel)
        self.addSubview(locationModifyButton)
        self.addSubview(locationExplainLabel)
    }
    
    override func setupLayout() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(16)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(16)
            make.height.equalTo(24)
        }
        
        nicknameLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(100)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(60)
            make.height.equalTo(40)
        }
        
        nicknameModifyButton.snp.makeConstraints { make in
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-24)
            make.height.equalTo(24)
            make.centerY.equalTo(nicknameLabel)
            make.width.equalTo(48)
        }
        
        locationContainView.snp.makeConstraints { make in
            make.top.equalTo(nicknameLabel.snp.bottom).offset(40)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(16)
            make.height.equalTo(120)
        }
        
        locationTitleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(locationContainView).inset(8)
            make.top.equalTo(locationContainView.snp.top).offset(8)
            make.height.equalTo(28)
        }
        
        locationModifyButton.snp.makeConstraints { make in
            make.trailing.equalTo(locationContainView.snp.trailing).offset(-8)
            make.centerY.equalTo(locationTitleLabel)
            make.height.equalTo(24)
            make.width.equalTo(48)
        }
        
        locationExplainLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(locationContainView)
            make.horizontalEdges.equalTo(locationExplainLabel).inset(16)
        }
    }
}


