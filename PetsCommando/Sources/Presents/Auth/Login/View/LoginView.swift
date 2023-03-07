//
//  SignUpView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/06.
//

import UIKit
import SnapKit

final class LoginView: BaseView {
    
    private var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.BaseColor.hunt4
        return view
    }()
    
    private var idLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title2_B16
        label.text = AuthString.id.text
        return label
    }()
    
    private var idLineTextField: LineTextFieldView = {
        let text = LineTextFieldView()
        text.textField.placeholder = AuthPlaceHolder.inputID.text
        return text
    }()
    
    private var pwLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title2_B16
        label.text = AuthString.pw.text
        return label
    }()
    
    private var pwLineTextField: LineTextFieldView = {
        let text = LineTextFieldView()
        text.textField.placeholder = AuthPlaceHolder.inputPW.text
        text.textField.isSecureTextEntry = true
        return text
    }()
    
    internal var loginIncludeView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.BaseColor.gray5
         view.clipsToBounds = true
         view.layer.cornerRadius = 8
         return view
    }()
    
    internal var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle(AuthString.login.text, for: .normal)
        button.setTitleColor(Color.BaseColor.white, for: .normal)
        return button
    }()
    
    internal var signupIncludeView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.BaseColor.hunt2
         view.clipsToBounds = true
         view.layer.cornerRadius = 8
         return view
    }()
    
    internal var signupButton: UIButton = {
        let button = UIButton()
        button.setTitle(AuthString.signup.text, for: .normal)
        button.setTitleColor(Color.BaseColor.white, for: .normal)
        return button
    }()
    
    override func setupAttributes() {
        [bgView, idLabel, idLineTextField, pwLabel, pwLineTextField, loginIncludeView, loginButton, signupIncludeView, signupButton].forEach {
            addSubview($0)
        }
    }
    override func setupLayout() {
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        idLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(200)
            make.height.equalTo(20)
        }
        
        idLineTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(idLabel.snp.bottom).offset(20)
        }
        
        pwLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(idLineTextField.snp.bottom).offset(40)
            make.height.equalTo(20)
        }
        
        pwLineTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(pwLabel.snp.bottom).offset(20)
        }
        
        loginIncludeView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(pwLineTextField.snp.bottom).offset(40)
            make.height.equalTo(40)
        }
        
        loginButton.snp.makeConstraints { make in
            make.edges.equalTo(loginIncludeView)
        }
        
        signupIncludeView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(loginButton.snp.bottom).offset(8)
            make.height.equalTo(40)
        }
        
        signupButton.snp.makeConstraints { make in
            make.edges.equalTo(signupIncludeView)
        }
    }
}
