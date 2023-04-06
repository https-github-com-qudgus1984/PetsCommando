//
//  HomeView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/08.
//

import UIKit

final class HomeView: BaseView {
    private var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.BaseColor.white
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title1_B20
        label.textColor = Color.BaseColor.hunt1
        label.textAlignment = .center
        return label
    }()
    
    private var imageView: UIImageView = {
        let image = UIImageView()
        image.image = Image.dogAndCat
        return image
    }()
    
    internal var communityLabel: UILabel = {
        let label = UILabel()
        label.text = HomeString.community.text
        label.font = Font.Body2_L16
        label.textColor = Color.BaseColor.gray7
        label.numberOfLines = 0
        label.textAlignment = .center
         return label
    }()
    
    internal var searchButton: CircleButton = {
       let button = CircleButton()
        button.setValidStatus(status: Status.search)
        button.setConfiguration()
        return button
    }()
    
    internal var plusButton: CircleButton = {
       let button = CircleButton()
        button.setValidStatus(status: Status.plus)
        button.setConfiguration()
        return button
    }()
    
    internal var findLostStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 1
        view.clipsToBounds = true
        view.layer.cornerRadius = view.bounds.width / 2
        return view
    }()
    
    
    internal var findButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = Color.BaseColor.hunt3
        button.setTitle("발견", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    internal var lostButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = Color.BaseColor.hunt3
        button.setTitle("분실", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func setupAttributes() {
        
        [bgView, titleLabel, imageView, communityLabel].forEach {
            addSubview($0)
        }
        
        [searchButton, plusButton, findLostStackView].forEach {
            addSubview($0)
        }
        
        [findButton, lostButton].forEach { self.findLostStackView.addArrangedSubview($0) }
        
    }
    
    override func setupLayout() {
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaInsets)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(60)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(120)
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(60)
            make.height.equalTo(imageView.snp.width)
        }
        
        communityLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(80)
            make.height.equalTo(80)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        findLostStackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(100)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(80)
            make.width.equalTo(40)
        }
        
        plusButton.snp.makeConstraints { make in
            make.bottom.equalTo(findLostStackView.snp.top).offset(-20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.width.equalTo(40)
        }
        
        searchButton.snp.makeConstraints { make in
            make.bottom.equalTo(plusButton.snp.top).offset(-20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.width.equalTo(40)
        }
    }
}


