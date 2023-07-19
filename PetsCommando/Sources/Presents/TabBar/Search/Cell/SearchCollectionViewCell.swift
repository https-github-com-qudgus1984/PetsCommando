//
//  SearchCollectionViewCell.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/19.
//

import UIKit
import SnapKit

class SearchCollectionViewCell: BaseCollectionViewCell {
    static let identifier = "SearchCollectionViewCell"

    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "stethoscope.circle.fill")
        view.tintColor = Color.BaseColor.gray6
        return view
    }()
    
    let hospitalLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body2_L16
        label.textColor = .black
        label.textAlignment = .left
        label.text = "우리동물병원"
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.font = Font.Body3_L12
        label.textColor = Color.BaseColor.gray6
        label.textAlignment = .right
        label.text = "양천구 문래동"
        return label
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.BaseColor.gray3
        return view
    }()
        
    override func configure() {
        self.addSubview(bgView)
        self.addSubview(imageView)
        self.addSubview(hospitalLabel)
        self.addSubview(locationLabel)
        self.addSubview(lineView)
    }
    
    override func setConstraints() {
        
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(40)
            make.centerY.equalTo(safeAreaLayoutGuide)
            make.leading.equalTo(safeAreaLayoutGuide).offset(20)
        }
        
        hospitalLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(16)
            make.centerY.equalTo(safeAreaLayoutGuide)
            make.trailing.equalTo(safeAreaLayoutGuide)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(16)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-20)
            make.centerY.equalTo(safeAreaLayoutGuide)
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.bottom.equalTo(safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
        }
    }
}
