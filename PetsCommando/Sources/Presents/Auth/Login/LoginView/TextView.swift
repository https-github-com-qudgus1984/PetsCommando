//
//  TextView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/04.
//

import UIKit
import SnapKit

class LoginView: BaseView {
    
    private var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.BaseColor.hunt2
        return view
    }()
    
    private var lolLabel: LineTextFieldView = {
        let label = LineTextFieldView()
        label.textField.font = Font.Title1_B20
        label.textField.textColor = Color.BaseColor.black
        label.textField.text = "LOL기장, LOL에 진심인 사람들을 위하여"
        label.textField.textAlignment = .center
        return label
    }()
    
    private var nicknameIncludeView: UIView = {
       let view = UIView()
        view.backgroundColor = Color.BaseColor.hunt2
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    internal var nicknameTextfield: UITextField = {
        let textfield = UITextField()
        textfield.font = UIFont(name: "GangwonEduAll-OTFLight", size: 20)
        textfield.placeholder = " 소환사 이름을 입력해주세요. "
        return textfield
    }()
    
    internal var searchIncludeView: UIView = {
        let view = UIView()
         view.backgroundColor = Color.BaseColor.hunt2
         view.clipsToBounds = true
         view.layer.cornerRadius = 8
         return view
    }()
    
    internal var searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("검색", for: .normal)
        return button
    }()
    
    override func setupAttributes() {
        [bgView, lolLabel, nicknameIncludeView, nicknameTextfield, searchIncludeView, searchButton].forEach {
            addSubview($0)
        }
    }
    override func setupLayout() {
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        lolLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalTo(bgView.snp.top).offset(80)
        }
        
        nicknameIncludeView.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalTo(lolLabel.snp.bottom).offset(40)
        }
        
        nicknameTextfield.snp.makeConstraints {
            $0.edges.equalTo(nicknameIncludeView.snp.edges).inset(4)
        }
        
        searchIncludeView.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.25)
            $0.height.equalToSuperview().multipliedBy(0.06)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        searchButton.snp.makeConstraints {
            $0.edges.equalTo(searchIncludeView.snp.edges).inset(0)
        }
    }
}
