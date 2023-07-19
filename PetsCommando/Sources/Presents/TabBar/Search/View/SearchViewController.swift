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
import CoreLocation


final class SearchViewController: BaseViewController, UICollectionViewDelegate {
    
    let selfView = SearchView()
    private let viewModel: SearchViewModel
    var locationManager = CLLocationManager()
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = selfView
    }
    
    let viewDidLoadObservable = BehaviorRelay<CLLocationCoordinate2D>(value: CLLocationCoordinate2D(latitude: 37.498333, longitude: 126.86666))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selfView.hospitalcollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)

        selfView.hospitalcollectionView.delegate = self
        selfView.hospitalcollectionView.dataSource = self
        selfView.mapView.delegate = self
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        selfView.mapView.showsUserLocation = true
        viewDidLoadObservable.accept(locationManager.location?.coordinate ?? CLLocationCoordinate2D(latitude: 37.498333, longitude: 126.86666))
        setupMap()
        
    }
    
    override func setupBinding() {
        let input = SearchViewModel.Input(locationButtonTapped: selfView.locationButton.rx.tap, viewDidLoad: self.viewDidLoadObservable)
        
        let output = viewModel.transform(input)
        
        //MARK: 여기서 내위치로 이동
        output.locationButtonTapped
            .observe(on: MainScheduler.instance)
            .bind { [weak self] _ in
                guard let self else { return }
                setupMap()
            }
            .disposed(by: self.disposeBag)
    }
    
    func setupMap() {
        self.selfView.mapView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 37.498333, longitude: locationManager.location?.coordinate.longitude ?? 126.86666), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: true)
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
