//
//  SearchView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/19.
//

import UIKit
import SnapKit
import MapKit

final class SearchView: BaseView {
    internal var mapView: MKMapView = {
        let view = MKMapView()
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동물병원 및 보호소"
        return label
    }()
    
    lazy var hospitalcollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 50)
        layout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    private var locationButtonImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "location.circle.fill")
        view.tintColor = Color.BaseColor.hunt4
        view.contentMode = .scaleToFill
        return view
    }()
    
    internal let locationButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override func setupAttributes() {
        self.addSubview(mapView)
        self.addSubview(titleLabel)
        self.addSubview(hospitalcollectionView)
        self.addSubview(locationButtonImageView)
        self.addSubview(locationButton)
    }
    
    override func setupLayout() {
        mapView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(475)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(mapView.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(8)
            make.height.equalTo(20)
        }
        
        hospitalcollectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(16)
            make.top.equalTo(titleLabel.snp.bottom)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        locationButtonImageView.snp.makeConstraints { make in
            make.trailing.equalTo(mapView.snp.trailing).offset(-16)
            make.bottom.equalTo(mapView.snp.bottom).offset(-16)
            make.height.width.equalTo(50)
        }
        
        locationButton.snp.makeConstraints { make in
            make.edges.equalTo(locationButtonImageView)
        }
    }
}
