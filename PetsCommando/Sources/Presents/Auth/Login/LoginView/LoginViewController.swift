//
//  LoginViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/04.
//

import UIKit
import SnapKit


final class LoginViewController: BaseViewController {
    
    //MARK: UI
    private lazy var scrollView = UIScrollView()
    private var contentView = UIView()
    private lazy var idTextField = LineTextFieldView()
    private lazy var passwordTextField = LineTextFieldView()
    
    //MARK: Delegate
    weak var coordinator: LoginCoordinator?
    
    override func loadView() {
        self.view = CheckNicknameView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//    override func setupAttributes() {
//        super.setupAttributes()
//        scrollView.isScrollEnabled = false
//
//    }
//
//    override func setupLayout() {
//        view.addSubview(scrollView)
//        scrollView.snp.makeConstraints { make in
//            make.edges.equalTo(view)
//        }
//
//        scrollView.addSubview(contentView)
//        contentView.snp.makeConstraints { make in
//            make.top.bottom.equalTo(scrollView)
//            make.leading.trailing.equalTo(view)
//            make.width.height.equalTo(view)
//        }
//
//        contentView.addSubview(idTextField)
//        idTextField.snp.makeConstraints { make in
//            make.horizontalEdges.equalToSuperview().inset(16)
//            make.top.equalToSuperview()
//        }
//
//        contentView.addSubview(passwordTextField)
//        passwordTextField.snp.makeConstraints { make in
//            make.horizontalEdges.equalToSuperview().inset(16)
//            make.top.equalTo(idTextField.snp.bottom).offset(16)
//        }
//    }
}

