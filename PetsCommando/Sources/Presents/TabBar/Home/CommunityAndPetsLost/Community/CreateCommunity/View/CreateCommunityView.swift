//
//  CreateCommunityView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/28.
//

import UIKit
import SnapKit

final class CreateCommunityView: BaseView {
    
    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.BaseColor.hunt4
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Title2_B16
        label.text = "제목"
        label.textAlignment = .left
        return label
    }()
    
    let containTitleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let imagePlusButton: UIButton = {
        let button = UIButton()
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.setImage(UIImage(systemName: "photo.circle.fill"), for: .normal)
        button.tintColor = Color.BaseColor.hunt2
        return button
    }()

    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "제목을 입력해주세요."
        return textField
    }()
    
    let imageAppealView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.clipsToBounds = true
        textView.layer.cornerRadius = 8
        return textView
    }()
    
    internal var registerContainView: UILabel = {
        let view = UILabel()
        view.backgroundColor = Color.BaseColor.gray6
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.text = "등록"
        view.textAlignment = .center
        view.textColor = .white
         return view
    }()
    
    internal var registerButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override func setupAttributes() {
        self.addSubview(bgView)
        self.addSubview(titleLabel)
        self.addSubview(containTitleView)
        self.addSubview(titleTextField)
        self.addSubview(imageAppealView)
        self.addSubview(textView)
        self.addSubview(registerContainView)
        self.addSubview(registerButton)
        self.addSubview(imagePlusButton)
    }
    
    override func layoutSubviews() {
        containTitleView.clipsToBounds = true
        containTitleView.layer.cornerRadius = 8
    }

    override func setupLayout() {
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(16)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(24)
        }
        
        containTitleView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(44)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.edges.equalTo(containTitleView).inset(8)
        }
        
        registerContainView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-36)
            make.height.equalTo(48)
        }
        
        registerButton.snp.makeConstraints { make in
            make.edges.equalTo(registerContainView)
        }
        
        imageAppealView.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(200)
        }
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(imageAppealView.snp.bottom).offset(20)
            make.bottom.equalTo(registerContainView.snp.top).offset(-20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
        }
        
        imagePlusButton.snp.makeConstraints { make in
            make.leading.bottom.equalTo(textView).inset(16)
            make.width.height.equalTo(48)
        }
    }
}

extension CreateCommunityView {
    func updateFinishDailyPost() {
        textView.text = nil
        titleTextField.text = nil
    }
}

extension CreateCommunityView {
    func updateProfileImage(image: UIImage) {
        self.imageAppealView.contentMode = .scaleToFill
        let resizeImage = image.resizeImageTo(size: CGSize(width: self.imageAppealView.frame.width, height: self.imageAppealView.frame.height))
        self.imageAppealView.image = resizeImage
    }
}
