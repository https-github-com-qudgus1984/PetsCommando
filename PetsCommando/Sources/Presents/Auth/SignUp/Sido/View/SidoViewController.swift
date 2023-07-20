//
//  SidoViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/19.
//

import UIKit
import RxSwift
import RxCocoa
import Toast

final class SidoViewController: BaseViewController {
    private let selfView = SidoView()
    private let viewModel: SidoViewModel
    
    init(viewModel: SidoViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("SidoViewController: fatal error")
    }
    
    override func loadView() {
        self.view = selfView
    }
    
    private var dataSource: UICollectionViewDiffableDataSource<Int, String>!
    
    let sidoCellSelected = PublishSubject<IndexPath>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataSource()
        selfView.collectionView.delegate = self
    }
    
    override func setupBinding() {
        let input = SidoViewModel.Input(viewDidLoad: Observable.just(()), sidoCellSelected: self.sidoCellSelected)
        let output = self.viewModel.transform(input)
        
        output.sidoList
            .observe(on: MainScheduler.instance)
            .bind { [weak self] sidoList in
                guard let self else { return }
                var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
                snapshot.appendSections([0])
                var section1Arr: [String] = []
                for i in sidoList {
                    section1Arr.append(i)
                }
                snapshot.appendItems(section1Arr, toSection: 0)
                self.dataSource.apply(snapshot)
        }
        .disposed(by: disposeBag)
        
    }
}

extension SidoViewController {
    func setDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<SidoCollectionViewCell, String> {  cell, indexPath, itemIdentifier in
            cell.categoryLabel.text = itemIdentifier
            self.sidoCellSelected.bind { index in
                if index == indexPath {
                    print("선택한 셀의 string",itemIdentifier)
                    UserDefaults.standard.set(itemIdentifier, forKey: "sido")
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

extension SidoViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.sidoCellSelected.onNext(indexPath)
    }
}
