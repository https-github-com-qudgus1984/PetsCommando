//
//  CommunityDetailView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/10.
//

import UIKit
import SnapKit

final class PetsLostDetailView: BaseView {

    let animalTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title1_B20
        label.text = "시고르브자브르종"
        return label
    }()
    
    let animalImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "dogAndCat")
        return view
    }()
    
    lazy var categoryStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        view.axis = .vertical
        view.spacing = 8
        view.addArrangedSubview(happenPlaceLabel)
        view.addArrangedSubview(animalColorLabel)
        view.addArrangedSubview(ageLabel)
        view.addArrangedSubview(weightLabel)
        view.addArrangedSubview(processStateLabel)
        view.addArrangedSubview(genderLabel)
        view.addArrangedSubview(specialLabel)
        view.addArrangedSubview(shelterLabel)
        view.addArrangedSubview(shelterAdressLabel)
        view.addArrangedSubview(phoneNumberLabel)

        return view
    }()
    
    lazy var explainStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        view.axis = .vertical
        view.spacing = 8
        view.addArrangedSubview(happenPlaceExplainLabel)
        view.addArrangedSubview(animalColorExplainLabel)
        view.addArrangedSubview(ageExplainLabel)
        view.addArrangedSubview(weightExplainLabel)
        view.addArrangedSubview(processStateExplainLabel)
        view.addArrangedSubview(genderExplainLabel)
        view.addArrangedSubview(specialExplainLabel)
        view.addArrangedSubview(shelterExplainLabel)
        view.addArrangedSubview(shelterAdressExplainLabel)
        view.addArrangedSubview(phoneNumberExplainLabel)

        return view
    }()
    
    //MARK: 발견 장소
    let happenPlaceLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        label.text = "발견 장소"
        return label
    }()
    
//    let kindLabel: UILabel = {
//        let label = UILabel()
//        label.font = Font.Body3_L12
//        return label
//    }()
    
    let animalColorLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        label.text = "동물 색상"
        return label
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        label.text = "나이"
        return label
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        label.text = "체중(kg)"
        return label
    }()
    //MARK: 동물 상태
    let processStateLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        label.text = "상태"
        return label
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        label.text = "성별"
        return label
    }()
    
    //MARK: 특징
    let specialLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        label.text = "특징"
        return label
    }()
    
    let shelterLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        label.text = "보호소 이름"
        return label
    }()
    
    let shelterAdressLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        label.text = "보호소 주소"
        return label
    }()
    
    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        label.text = "보호소 번호"
        return label
    }()
    
    //MARK: 발견 장소
    let happenPlaceExplainLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        return label
    }()
    
//    let kindExplainLabel: UILabel = {
//        let label = UILabel()
//        label.font = Font.Body3_L12
//        return label
//    }()
    
    let animalColorExplainLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        return label
    }()
    
    let ageExplainLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        return label
    }()
    
    let weightExplainLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        return label
    }()
    //MARK: 동물 상태
    let processStateExplainLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        return label
    }()
    
    let genderExplainLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        return label
    }()
    
    //MARK: 특징
    let specialExplainLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        return label
    }()
    
    let shelterExplainLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        return label
    }()
    
    let shelterAdressExplainLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        return label
    }()
    
    let phoneNumberExplainLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        return label
    }()
    
    override func setupAttributes() {
        self.addSubview(animalTitleLabel)
        self.addSubview(animalImageView)
        self.addSubview(categoryStackView)
        self.addSubview(explainStackView)
    }
    
    override func setupLayout() {
        animalTitleLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(16)
            make.height.equalTo(48)
        }
        
        animalImageView.snp.makeConstraints { make in
            make.top.equalTo(animalTitleLabel.snp.bottom).offset(16)
            make.height.width.equalTo(200)
            make.centerX.equalTo(safeAreaLayoutGuide)
        }
        
        categoryStackView.snp.makeConstraints { make in
            make.top.equalTo(animalImageView.snp.bottom).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide).offset(16)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-16)
            make.width.equalTo(72)
        }
        
        explainStackView.snp.makeConstraints { make in
            make.leading.equalTo(categoryStackView.snp.trailing)
            make.verticalEdges.equalTo(categoryStackView.snp.verticalEdges)
            make.trailing.equalTo(safeAreaLayoutGuide)
        }
    }
}
