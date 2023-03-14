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
        label.text = "PetsCommando"
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
    
    
    override func setupAttributes() {
        [bgView, titleLabel, imageView, communityLabel].forEach {
            addSubview($0)
        }
    }
    override func setupLayout() {
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.horizontalEdges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(60)
            make.height.equalTo(imageView.snp.width)
        }
        
        communityLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.height.equalTo(80)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
    }
}
