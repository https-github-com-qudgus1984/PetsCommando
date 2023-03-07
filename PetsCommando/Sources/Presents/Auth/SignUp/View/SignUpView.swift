//
//  TextView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/04.
//

import UIKit
import SnapKit

final class SignUpView: BaseView {
    
    private var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.BaseColor.hunt1
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
    
    private var idCertificationButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(Color.BaseColor.gray3, for: .normal)
        button.backgroundColor = Color.BaseColor.gray5
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.setTitle("인증", for: .normal)
        return button
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
    
    private var checkpwLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title2_B16
        label.text = AuthString.pw.text
        return label
    }()
    
    private var checkpwLineTextField: LineTextFieldView = {
        let text = LineTextFieldView()
        text.textField.placeholder = AuthPlaceHolder.inputPW.text
        text.textField.isSecureTextEntry = true
        return text
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
        button.setTitleColor(Color.BaseColor.black, for: .normal)
        return button
    }()
    
    override func setupAttributes() {
        [bgView, idLabel, idLineTextField, idCertificationButton, pwLabel, pwLineTextField, checkpwLabel, checkpwLineTextField, signupIncludeView, signupButton].forEach {
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
        
        idCertificationButton.snp.makeConstraints { make in
            make.trailing.equalTo(idLineTextField.snp.trailing)
            make.height.equalTo(idLineTextField.snp.height)
            make.width.equalTo(60)
            make.bottom.equalTo(idLineTextField.snp.bottom).inset(4)
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
        
        checkpwLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(pwLineTextField.snp.bottom).offset(40)
            make.height.equalTo(20)
        }
        
        checkpwLineTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(checkpwLabel.snp.bottom).offset(20)
        }
        
        signupIncludeView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(checkpwLineTextField.snp.bottom).offset(40)
            make.height.equalTo(40)
        }
        
        signupButton.snp.makeConstraints { make in
            make.edges.equalTo(signupIncludeView)
        }
    }
}
