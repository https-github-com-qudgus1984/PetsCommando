//
//  LocationModifySigunguViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/21.
//

import UIKit
import RxSwift
import RxCocoa
import Toast

final class LocationModifySigunguViewController: BaseViewController {
    private let selfView = LocationModifySigunguView()
    private let viewModel: LocationModifySigunguViewModel
    
    init(viewModel: LocationModifySigunguViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("SigunguViewController: fatal error")
    }
    
    override func loadView() {
        self.view = selfView
    }
    
    private var dataSource: UICollectionViewDiffableDataSource<Int, String>!
    
    let sigunguCellSelected = PublishSubject<IndexPath>()
    let dataSetFinish = PublishRelay<Void>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataSource()
        selfView.collectionView.delegate = self
        
    }
    
    override func setupBinding() {
        let input = LocationModifySigunguViewModel.Input(viewDidLoad: Observable.just(()), sigunguCellSelected: self.sigunguCellSelected, dataSetFinish: self.dataSetFinish)
        let output = self.viewModel.transform(input)
        //MARK: SenceDelegate에 AppCoordinator 재실행해줘야함
        
        output.sigunguList
            .observe(on: MainScheduler.instance)
            .bind { [weak self] sigunguList in
                guard let self else { return }
                var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
                snapshot.appendSections([0])
                var section1Arr: [String] = []
                for i in sigunguList {
                    section1Arr.append(i)
                }
                snapshot.appendItems(section1Arr, toSection: 0)
                self.dataSource.apply(snapshot)
        }
        .disposed(by: disposeBag)
        
        output.dataSetFinish
            .withUnretained(self)
            .observe(on: MainScheduler.instance)
            .bind { vc, _ in
                vc.view.makeToast("변경되었습니다.")
            }
            .disposed(by: disposeBag)
    }
}

extension LocationModifySigunguViewController {
    func setDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<SidoCollectionViewCell, String> {  cell, indexPath, itemIdentifier in
            cell.categoryLabel.text = itemIdentifier
            self.sigunguCellSelected.bind { index in
                if index == indexPath {
                    UserDefaults.standard.set(itemIdentifier, forKey: "sigungu")
                    UserDefaults.standard.set(true, forKey: "locationChanged")
                    self.dataSetFinish.accept(())
                }
            }
            .disposed(by: self.disposeBag)
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: selfView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
}

extension LocationModifySigunguViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.sigunguCellSelected.onNext(indexPath)
    }
}
