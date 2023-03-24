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
        view.backgroundColor = Color.BaseColor.hunt4
        return view
    }()
    
    private var idLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title2_B16
        label.text = AuthString.id.text
        return label
    }()
    
    internal var idLineTextField: LineTextFieldView = {
        let text = LineTextFieldView()
        text.textField.placeholder = AuthPlaceHolder.inputID.text
        return text
    }()
    
    internal var idValidLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title2_B16
        label.textColor = .systemRed
        return label
    }()
    
    internal var idCertificationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Color.BaseColor.gray5
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.setTitle(AuthString.auth.text, for: .normal)
        return button
    }()
    
    private var nicknameLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title2_B16
        label.text = AuthString.nickname.text
        return label
    }()
    
    internal var nicknameLineTextField: LineTextFieldView = {
        let text = LineTextFieldView()
        text.textField.placeholder = AuthPlaceHolder.inputNickname.text
        return text
    }()
    
    internal var nicknameValidLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title2_B16
        label.textColor = .systemRed
        return label
    }()
    
    internal var nicknameCertificationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Color.BaseColor.gray5
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.setTitle(AuthString.auth.text, for: .normal)
        return button
    }()
    
    private var pwLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title2_B16
        label.text = AuthString.pw.text
        return label
    }()
    
    internal var pwLineTextField: LineTextFieldView = {
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
    
    internal var checkpwLineTextField: LineTextFieldView = {
        let text = LineTextFieldView()
        text.textField.placeholder = AuthPlaceHolder.inputPW.text
        text.textField.isSecureTextEntry = true
        return text
    }()
    
    internal var pwValidLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title2_B16
        label.textColor = .systemRed
        return label
    }()
    
    internal var signupIncludeView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.BaseColor.hunt2
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
         return view
    }()
    
    internal var signupButton: UIButton = {
        let button = UIButton()
        button.setTitle(AuthString.signup.text, for: .normal)
        button.setTitleColor(Color.BaseColor.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
    
    override func setupAttributes() {
        [bgView, idLabel, idLineTextField, idCertificationButton, idValidLabel, nicknameLabel, nicknameLineTextField, nicknameCertificationButton, nicknameValidLabel, pwLabel, pwLineTextField, checkpwLabel, checkpwLineTextField, pwValidLabel, signupIncludeView, signupButton].forEach {
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
        
        idValidLabel.snp.makeConstraints { make in
            make.top.equalTo(idLineTextField.snp.bottom).offset(8)
            make.height.equalTo(20)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        nicknameLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(idLineTextField.snp.bottom).offset(40)
            make.height.equalTo(20)
        }
        
        nicknameLineTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(nicknameLabel.snp.bottom).offset(20)
        }
        
        nicknameCertificationButton.snp.makeConstraints { make in
            make.trailing.equalTo(nicknameLineTextField.snp.trailing)
            make.height.equalTo(nicknameLineTextField.snp.height)
            make.width.equalTo(60)
            make.bottom.equalTo(nicknameLineTextField.snp.bottom).inset(4)
        }
        
        nicknameValidLabel.snp.makeConstraints { make in
            make.top.equalTo(nicknameLineTextField.snp.bottom).offset(8)
            make.height.equalTo(20)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        pwLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(nicknameLineTextField.snp.bottom).offset(40)
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
        
        pwValidLabel.snp.makeConstraints { make in
            make.top.equalTo(checkpwLineTextField.snp.bottom).offset(8)
            make.height.equalTo(20)
            make.horizontalEdges.equalToSuperview().inset(20)
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
