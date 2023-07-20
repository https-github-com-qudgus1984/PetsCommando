//
//  PetsListViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/07.
//

import UIKit
import RxSwift
import RxCocoa

final class PetsLostViewController: BaseViewController {
    
    let petsLostView = PetsLostView()
    let viewModel: PetsLostViewModel

    init(viewModel: PetsLostViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = petsLostView
    }
    
    let cellSelected = PublishSubject<Void>()
    
    private var dataSource: UICollectionViewDiffableDataSource<Int, List?>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataSource()
        petsLostView.collectionView.register(PetsLostCollectionViewCell.self, forCellWithReuseIdentifier: PetsLostCollectionViewCell.identifier)

        petsLostView.collectionView.delegate = self

    }
    
    override func setupBinding() {
        let input = PetsLostViewModel.Input(viewDidLoad: Observable.just(()), cellSelected: self.cellSelected)
        let output = viewModel.transform(input)
        
        output.organicAnimalList
            .observe(on: MainScheduler.instance)
            .bind { [weak self] animalList in
                guard let self else { return }
                var snapshot = NSDiffableDataSourceSnapshot<Int, List?>()
                snapshot.appendSections([0])
                var sectionArr: [List?] = []
                for i in animalList {
                    sectionArr.append(i)
                }
                snapshot.appendItems(sectionArr, toSection: 0)
                self.dataSource.apply(snapshot)
            }
            .disposed(by: disposeBag)
    }
}

extension PetsLostViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("이건찍히지")
        self.cellSelected.onNext(())
    }
}

extension PetsLostViewController {
    func setDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<PetsLostCollectionViewCell, List> {  cell, indexPath, itemIdentifier in
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: petsLostView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
}
