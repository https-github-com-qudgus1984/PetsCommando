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
    
    var dataSource: UICollectionViewDiffableDataSource<Int, String>!
    var snapshot = NSDiffableDataSourceSnapshot<Int, String>()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataSource()
    }
    
    override func setupBinding() {
        let input = SidoViewModel.Input(viewDidLoad: Observable.just(()))
        let output = self.viewModel.transform(input)
        
        output.sidoList.bind { [weak self] sidoList in
            print(sidoList)
        }
        .disposed(by: disposeBag)
        
    }
}

extension SidoViewController {
    func setDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<SidoCollectionViewCell, String> {  cell, indexPath, itemIdentifier in
            cell.categoryLabel.text = itemIdentifier
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: selfView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
        
        snapshot.appendSections([0])
        var sidoArr: [String] = ["서울특별시", "부산광역시", "나는몰라"]

        
        snapshot.appendItems(sidoArr, toSection: 0)
        dataSource.apply(snapshot)
    }
}
