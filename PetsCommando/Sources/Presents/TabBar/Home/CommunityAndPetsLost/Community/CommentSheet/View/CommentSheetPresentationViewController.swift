//
//  CommentSheetPresentationViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/28.
//

import UIKit
import RxSwift
import RxCocoa

class CommentSheetPresentationViewController: BaseViewController {
    
    let selfView = CommentSheetPresentationView()
    let viewModel: CommentSheetPresentationViewModel
    
    //MARK: Delegate
    init(viewModel: CommentSheetPresentationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = selfView
    }
    
    let viewDidLoadTrigger = PublishRelay<Void>()
    
    private var dataSource: UICollectionViewDiffableDataSource<Int, Comment?>!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        selfView.reviewCollectionView.delegate = self
        setupSheet()
        setDateSource()
        self.viewDidLoadTrigger.accept(())
    }
    
    override func setupBinding() {
        let input = CommentSheetPresentationViewModel.Input(viewDidLoad: self.viewDidLoadTrigger, registerButtonTap: self.selfView.registerButton.rx.tap.withLatestFrom(self.selfView.reviewTextField.rx.text.orEmpty).asSignal(onErrorJustReturn: ""))
        
        let output = viewModel.transform(input)
        
        output.commentList
            .observe(on: MainScheduler.instance)
            .withUnretained(self)
            .bind { vc, commentList in
                var snapshot = NSDiffableDataSourceSnapshot<Int, Comment?>()
                snapshot.appendSections([0])
                var sectionArr: [Comment?] = []
                for i in commentList {
                    guard let i else { return }
                    sectionArr.append(i)
                }
                snapshot.appendItems(sectionArr, toSection: 0)
                self.dataSource.apply(snapshot)
            }
            .disposed(by: disposeBag)
    }
}

extension CommentSheetPresentationViewController: UICollectionViewDelegate {
    
}

extension CommentSheetPresentationViewController {
    func setDateSource() {
        let cellRegistration = UICollectionView.CellRegistration<CommunityCollectionViewCell, Comment> {  cell, indexPath, itemIdentifier in
            cell.titleLabel.text = itemIdentifier.nickname
            cell.contentLabel.text = itemIdentifier.content
            cell.registerTimeLabel.text = itemIdentifier.registerAt
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: selfView.reviewCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
}

extension CommentSheetPresentationViewController {
    private func setupSheet() {
        if let sheet = sheetPresentationController {
            /// 드래그를 멈추면 그 위치에 멈추는 지점: default는 large()
            sheet.detents = [.medium(), .large()]
            /// 초기화 드래그 위치
            sheet.selectedDetentIdentifier = .medium
            /// sheet아래에 위치하는 ViewController를 흐려지지 않게 하는 경계값 (medium 이상부터 흐려지도록 설정)
            sheet.largestUndimmedDetentIdentifier = .medium
            /// sheet로 present된 viewController내부를 scroll하면 sheet가 움직이지 않고 내부 컨텐츠를 스크롤되도록 설정
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            /// grabber바 보이도록 설정
            sheet.prefersGrabberVisible = true
            /// corner 값 설정
            //            sheet.preferredCornerRadius = 32.0
        }
    }
}
