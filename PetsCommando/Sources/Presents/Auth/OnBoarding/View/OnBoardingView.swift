//
//  CertificationView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/06.
//

import UIKit
import SnapKit

final class OnBoardingView: BaseView {
    
    private var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.BaseColor.hunt4
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
        image.image = Image.iconImg
        return image
    }()
    
    internal var startIncludeView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.BaseColor.hunt1
         view.clipsToBounds = true
         view.layer.cornerRadius = 16
         return view
    }()
    
    internal var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("시작하기", for: .normal)
        button.setTitleColor(Color.BaseColor.white, for: .normal)
        return button
    }()
    
    override func setupAttributes() {
        [bgView, titleLabel, startIncludeView, imageView, startButton].forEach {
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
        
        startIncludeView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(40)
            make.height.equalTo(52)
            make.horizontalEdges.equalToSuperview().inset(60)
        }
        
        startButton.snp.makeConstraints { make in
            make.edges.equalTo(startIncludeView)
        }
    }
}
