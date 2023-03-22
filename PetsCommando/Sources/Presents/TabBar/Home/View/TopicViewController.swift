//
//  PageView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/18.
//

import UIKit

protocol TopicViewControllerEvent: AnyObject {
    func topic(_ viewController: TopicViewController, didSelectItem: Community)
}

class TopicViewController: BaseViewController {
    
    let topicView = TopicView()
    override func loadView() {
        self.view = topicView
    }
    
    var collectionViewDataSource: UICollectionViewDiffableDataSource<String, Community>!
    
    weak var eventDelegate: TopicViewControllerEvent?
    
    var months = Community.allCases
    
    override func setupLayout() {
        configureCollectionViewDataSource()
        applyInitSnapShot(items: months)
        topicView.collectionView.delegate = self
    }
}




// MARK: - DataSource, snapShot
extension TopicViewController {
    
    func configureCollectionViewDataSource() {
        let topicCellRegistration = UICollectionView.CellRegistration<TopicCell, Community> { cell,indexPath,itemIdentifier in
            cell.configureCell(itemIdentifier: itemIdentifier)
        }
        collectionViewDataSource = .init(collectionView: topicView.collectionView) { collectionView, indexPath, itemIdentifier in
            let cell = self.topicView.collectionView.dequeueConfiguredReusableCell(using: topicCellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        }
    }
    
    func applyInitSnapShot(items: [Community]) {
        var snapshot = collectionViewDataSource.snapshot()
        snapshot.appendSections(["topic"])
        snapshot.appendItems(items, toSection: "topic")
        collectionViewDataSource.apply(snapshot)
    }
}




// MARK: - UICollectionViewDelegate - didSelectItemAt
extension TopicViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        if let itemIdentifier = collectionViewDataSource.itemIdentifier(for: indexPath) {
            eventDelegate?.topic(self, didSelectItem: itemIdentifier)
        }
    }
}
