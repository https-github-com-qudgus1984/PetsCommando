//
//  EmailView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/25.
//

import UIKit
import SnapKit

final class EmailView: BaseView {
    private var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.BaseColor.hunt4
        return view
    }()
    
    private var emailLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title2_B16
        label.text = AuthString.id.text
        label.textAlignment = .center
        return label
    }()
    
    internal var emailLineTextField: LineTextFieldView = {
        let text = LineTextFieldView()
        text.textField.placeholder = AuthPlaceHolder.inputID.text
        return text
    }()
    
    internal var emailValidLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title2_B16
        label.textColor = .systemRed
        label.text = ValidationString.duplicateInspectionEmail.text
        label.textAlignment = .right
        return label
    }()
    
    internal var emailCertificationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Color.BaseColor.gray5
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.setTitle(AuthString.auth.text, for: .normal)
        return button
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
        [bgView, emailLabel, emailLineTextField,emailCertificationButton, emailValidLabel, nextIncludeView, nextButton]
            .forEach { addSubview($0) }
    }
    
    override func setupLayout() {
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        emailLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalToSuperview().inset(200)
            make.height.equalTo(40)
        }
        
        emailLineTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(emailLabel.snp.bottom).offset(40)
        }
        
        emailCertificationButton.snp.makeConstraints { make in
            make.trailing.equalTo(emailLineTextField.snp.trailing)
            make.height.equalTo(emailLineTextField.snp.height)
            make.width.equalTo(60)
            make.bottom.equalTo(emailLineTextField.snp.bottom).inset(4)
        }
        
        emailValidLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLineTextField.snp.bottom).offset(8)
            make.height.equalTo(20)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        nextIncludeView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(emailValidLabel.snp.bottom).offset(40)
            make.height.equalTo(48)
        }
        
        nextButton.snp.makeConstraints { make in
            make.edges.equalTo(nextIncludeView)
        }
    }
}


