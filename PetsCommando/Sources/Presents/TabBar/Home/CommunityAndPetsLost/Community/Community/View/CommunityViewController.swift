//
//  CommunityViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/07.
//

import UIKit
import RxSwift
import RxCocoa

final class CommunityViewController: BaseViewController, UICollectionViewDelegate {
    
    let communityView = CommunityView()
    let viewModel: CommunityViewModel
    
    //MARK: Delegate
    init(viewModel: CommunityViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    let viewDidLoadTrigger = PublishRelay<Void>()
    let cellSelected = PublishSubject<IndexPath>()
    let postList = PublishSubject<ThumbnailDailyPost?>()
    let choicePost = PublishRelay<ThumbnailDailyPost?>()
    
    private var dataSource: UICollectionViewDiffableDataSource<Int, ThumbnailDailyPost?>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDateSource()
        
        communityView.collectionView.delegate = self
        self.viewDidLoadTrigger.accept(())
    }
    
    override func loadView() {
        self.view = communityView
    }
    
    override func setupBinding() {
        let input = CommunityViewModel.Input(viewDidLoad: self.viewDidLoadTrigger, createButtonTap: self.communityView.plusButton.rx.tap, choicePost: self.choicePost)
        
        let output = viewModel.transform(input)
        
        output.postList
            .observe(on: MainScheduler.instance)
            .withUnretained(self)
            .bind { vc, postList in
                var snapshot = NSDiffableDataSourceSnapshot<Int, ThumbnailDailyPost?>()
                snapshot.appendSections([0])
                var sectionArr: [ThumbnailDailyPost?] = []
                for i in postList {
                    sectionArr.append(i)
                }
                snapshot.appendItems(sectionArr, toSection: 0)
                self.dataSource.apply(snapshot)
            }
            .disposed(by: disposeBag)
        
    }
}

extension CommunityViewController {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("이건찍히지")
        dataFetching(indexPath: indexPath)
    }
}

extension CommunityViewController {
    func setDateSource() {
        let cellRegistration = UICollectionView.CellRegistration<CommunityCollectionViewCell, ThumbnailDailyPost> {  cell, indexPath, itemIdentifier in
            cell.titleLabel.text = itemIdentifier.title
            cell.registerTimeLabel.text = itemIdentifier.registerAt
            cell.contentLabel.text = "게시물 댓글 수 : " + String(itemIdentifier.commentcount ?? 0)
        
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: communityView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
}

extension CommunityViewController {
    func dataFetching(indexPath: IndexPath) {
        let selectedItem = dataSource.snapshot().itemIdentifiers[indexPath.row]
        self.choicePost.accept(selectedItem)
    }
}
