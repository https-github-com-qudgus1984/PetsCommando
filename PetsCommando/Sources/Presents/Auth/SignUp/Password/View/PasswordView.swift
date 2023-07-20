//
//  PasswordView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/25.
//

import UIKit
import SnapKit

final class PasswordView: BaseView {
    private var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.BaseColor.hunt4
        return view
    }()
    
    private var passwordLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title2_B16
        label.text = AuthString.pw.text
        label.textAlignment = .center
        return label
    }()
    
    internal var passwordLineTextField: LineTextFieldView = {
        let text = LineTextFieldView()
        text.textField.placeholder = AuthPlaceHolder.inputPW.text
        text.textField.isSecureTextEntry = true
        return text
    }()
    
    internal var passwordValidLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title2_B16
        label.textColor = .systemRed
        label.text = ValidationString.passwordFormat.text
        label.textAlignment = .right
        return label
    }()
    
    private var checkPasswordLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title2_B16
        label.text = AuthString.pw.text
        return label
    }()
    
    internal var checkPasswordLineTextField: LineTextFieldView = {
        let text = LineTextFieldView()
        text.textField.placeholder = AuthPlaceHolder.inputPW.text
        text.textField.isSecureTextEntry = true
        return text
    }()
    
    internal var checkPasswordValidLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title2_B16
        label.textColor = .systemRed
        label.text = ValidationString.notSamePW.text
        label.textAlignment = .right
        return label
    }()
    
    internal var nextIncludeView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.BaseColor.hunt2
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
         return view
    }()
    
    internal var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle(AuthString.next.text, for: .normal)
        button.setTitleColor(Color.BaseColor.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
    
    override func setupAttributes() {
        [bgView, passwordLabel, passwordLineTextField, passwordValidLabel, checkPasswordLineTextField, checkPasswordLabel, checkPasswordValidLabel, nextIncludeView, nextButton]
            .forEach { addSubview($0) }
    }
    
    override func setupLayout() {
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalToSuperview().inset(200)
            make.height.equalTo(40)
        }
        
        passwordLineTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(passwordLabel.snp.bottom).offset(40)
        }
        
        passwordValidLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordLineTextField.snp.bottom).offset(8)
            make.height.equalTo(20)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        checkPasswordLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(passwordLineTextField.snp.bottom).offset(40)
            make.height.equalTo(20)
        }
        
        checkPasswordLineTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(checkPasswordLabel.snp.bottom).offset(20)
        }
        
        checkPasswordValidLabel.snp.makeConstraints { make in
            make.top.equalTo(checkPasswordLineTextField.snp.bottom).offset(8)
            make.height.equalTo(20)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        nextIncludeView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(checkPasswordValidLabel.snp.bottom).offset(40)
            make.height.equalTo(48)
        }
        
        nextButton.snp.makeConstraints { make in
            make.edges.equalTo(nextIncludeView)
        }
    }
}
