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
        [bgView, titleLabel, startIncludeView, startButton].forEach {
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
        
        startIncludeView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(250)
            make.height.equalTo(52)
            make.horizontalEdges.equalToSuperview().inset(60)
        }
        
        startButton.snp.makeConstraints { make in
            make.edges.equalTo(startIncludeView)
        }
    }

}
