//
//  PetsListViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/07.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

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
    
    let cellSelected = PublishSubject<IndexPath>()
    let organicAnimal = PublishSubject<List?>()
    
    private var dataSource: UICollectionViewDiffableDataSource<Int, List?>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataSource()

        petsLostView.collectionView.delegate = self

    }
    
    override func setupBinding() {
        let input = PetsLostViewModel.Input(viewDidLoad: Observable.just(()), organicAnimal: self.organicAnimal)
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
        self.cellSelected.onNext((indexPath))
    }
}

extension PetsLostViewController {
    func setDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<PetsLostCollectionViewCell, List> {  cell, indexPath, itemIdentifier in
            if itemIdentifier.sexCD == "M" {
                cell.genderLabel.text = "남자"
            } else if itemIdentifier.sexCD == "F" {
                cell.genderLabel.text = "여자"
            } else {
                cell.genderLabel.text = "미상"
            }
            cell.speciesLabel.text = itemIdentifier.kindCD
            cell.shelterLabel.text = itemIdentifier.careNm
            cell.euthanasiaLabel.text = itemIdentifier.careTel
            cell.characteristicLabel.text = itemIdentifier.specialMark
            let imageURL = URL(string: itemIdentifier.filename)
            cell.imgView.kf.setImage(with: imageURL)
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: petsLostView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            
            self.cellSelected.bind { [weak self] index in
                guard let self else { return }
                if index == indexPath {
                    self.organicAnimal.onNext(itemIdentifier)
                }
            }
            .disposed(by: self.disposeBag)
            
            return cell
        })
    }
}
