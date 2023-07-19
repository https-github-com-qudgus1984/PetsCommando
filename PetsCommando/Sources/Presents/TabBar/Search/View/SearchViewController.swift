//
//  SearchViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/19.
//

import UIKit
import RxSwift
import RxCocoa
import MapKit


final class SearchViewController: BaseViewController, UICollectionViewDelegate {
    
    let selfView = SearchView()
    private let viewModel: SearchViewModel
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = selfView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selfView.hospitalcollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)

        selfView.hospitalcollectionView.delegate = self
        selfView.hospitalcollectionView.dataSource = self
        selfView.mapView.delegate = self
        setupMap()
        
    }
    
    func setupMap() {
        self.selfView.mapView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.498333, longitude: 126.866667), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: true)
    }
}

extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as! SearchCollectionViewCell
        
        return cell
    }
}

extension SearchViewController: MKMapViewDelegate, CLLocationManagerDelegate {
    
}
