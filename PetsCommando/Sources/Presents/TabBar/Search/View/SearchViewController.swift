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


final class SearchViewController: BaseViewController {
    
    var cnt = 0
    
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
    
    let hospitalList = PublishRelay<[Hospital]>()
    
    private var dataSource: UICollectionViewDiffableDataSource<Int, Hospital>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selfView.hospitalcollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        
        selfView.hospitalcollectionView.delegate = self
        selfView.mapView.delegate = self
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        selfView.mapView.showsUserLocation = true
        viewDidLoadObservable.accept(locationManager.location?.coordinate ?? CLLocationCoordinate2D(latitude: 37.498333, longitude: 126.86666))

        setupMap()
        setDataSource()
        
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
        
        output.hospitalList
            .observe(on: MainScheduler.instance)
            .bind { [weak self] hospitalList in
                guard let self else {return }
                self.hospitalList.accept(hospitalList)

                var snapshot = NSDiffableDataSourceSnapshot<Int, Hospital>()
                snapshot.appendSections([0])
                var sectionArr: [Hospital] = []
                for i in hospitalList {
                    sectionArr.append(i)
                }
                snapshot.appendItems(sectionArr, toSection: 0)
                self.dataSource.apply(snapshot)
                
                print(hospitalList.count, "총 병원 개수")

            }
            .disposed(by: disposeBag)
        
        output.hospitalList
            .observe(on: MainScheduler.instance)
            .bind { [weak self] hospitalList in
                guard let self else { return }
                for i in hospitalList {
                    let lon = CLLocationDegrees(i.longtitude ?? "0")
                    let lat = CLLocationDegrees(i.latitude ?? "0")
                    self.addPin(coordinate: CLLocationCoordinate2D(latitude: lat ?? 37.498333, longitude: lon ?? 126.86666), title: i.name, subtitle: i.address)
                }
            }
            .disposed(by: disposeBag)
    }
    
    func setupMap() {
        self.selfView.mapView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 37.498333, longitude: locationManager.location?.coordinate.longitude ?? 126.86666), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: true)
    }
}

extension SearchViewController: UICollectionViewDelegate {
    
}

extension SearchViewController: MKMapViewDelegate, CLLocationManagerDelegate {
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        <#code#>
//    }
}

//MARK: Pin 설정 관련
extension SearchViewController {
    private func addPin(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        let pin = CustomAnnotation(title: title, subtitle: subtitle, coordinate: coordinate)
        pin.coordinate = coordinate
        selfView.mapView.addAnnotation(pin)
        self.cnt += 1
    }
}

extension SearchViewController {
    func setDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<SearchCollectionViewCell, Hospital> { cell, indexPath, itemIdentifier in
            cell.hospitalLabel.text = itemIdentifier.name
            cell.locationLabel.text = itemIdentifier.address
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: selfView.hospitalcollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            
            return cell
        })
        
    }
}
