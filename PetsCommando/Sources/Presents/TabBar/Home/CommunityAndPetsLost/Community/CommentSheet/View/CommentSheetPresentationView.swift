//
//  CommentSheetPresentationView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/28.
//

import UIKit
import SnapKit

final class CommentSheetPresentationView: BaseView {
    lazy var reviewCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 16, height: UIScreen.main.bounds.height / 8)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    let reviewContainView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.BaseColor.hunt4
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    let reviewTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = Color.BaseColor.hunt4
        tf.placeholder = "댓글을 작성해보세요."
        return tf
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("등록", for: .normal)
        button.backgroundColor = Color.BaseColor.hunt3
        button.layer.cornerRadius = 4
        return button
    }()
    
    override func setupAttributes() {
        self.addSubview(reviewContainView)
        self.addSubview(reviewTextField)
        self.addSubview(registerButton)
        self.addSubview(reviewCollectionView)
    }
    
    override func setupLayout() {
        reviewCollectionView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.bottom.equalTo(reviewContainView.snp.top).offset(-20)
        }
        
        reviewContainView.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-36)
            make.leading.equalTo(safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-66)
            make.height.equalTo(44)
        }
        
        reviewTextField.snp.makeConstraints { make in
            make.edges.equalTo(reviewContainView).inset(4)
        }
        
        registerButton.snp.makeConstraints { make in
            make.bottom.equalTo(reviewTextField.snp.bottom)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-16)
            make.height.equalTo(reviewTextField.snp.height)
            make.leading.equalTo(reviewContainView.snp.trailing).offset(8)
        }
    }
}

extension CommentSheetPresentationView {
    func updatePostCommentAfter() {
        reviewTextField.text = nil
    }
}
