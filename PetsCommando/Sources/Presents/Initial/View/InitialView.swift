//
//  InitialView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/06.
//

import UIKit
import SnapKit

final class InitialView: BaseView {
    
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
    
    
    override func setupAttributes() {
        [bgView, titleLabel].forEach {
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
        

    }
}
