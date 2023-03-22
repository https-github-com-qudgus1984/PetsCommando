//
//  CustomTabBarView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/14.
//
import UIKit

final class CustomTabManView: BaseView {
    let tapBarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 30)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    let pageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 390, height: 600)
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()

    let hightlightView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tapBarCollectionView {
            guard let cell = tapBarCollectionView.cellForItem(at: indexPath) as? TabCollectionViewCell else { return }
            
            NSLayoutConstraint.deactivate(constraints)
            hightlightView.translatesAutoresizingMaskIntoConstraints = false
            constraints = [
                hightlightView.topAnchor.constraint(equalTo: tapBarCollectionView.bottomAnchor),
                hightlightView.bottomAnchor.constraint(equalTo: pageCollectionView.topAnchor),
                hightlightView.heightAnchor.constraint(equalToConstant: 1),
                hightlightView.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
                hightlightView.trailingAnchor.constraint(equalTo: cell.trailingAnchor)
            ]
            NSLayoutConstraint.activate(constraints)
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
            pageCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint,targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let layout = self.pageCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        if scrollView == pageCollectionView {
            let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
            let offset = targetContentOffset.pointee
            let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
            let roundedIndex = round(index)
            let indexPath = IndexPath(item: Int(roundedIndex), section: 0)
            
            targetContentOffset.pointee = CGPoint(x: roundedIndex * cellWidthIncludingSpacing -scrollView.contentInset.left,
                                                    y: scrollView.contentInset.top)
            // topTapItem Select
            tapBarCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .bottom)
            // collectionView didSelectedItemAt delegate
            collectionView(tapBarCollectionView, didSelectItemAt: indexPath)
            // topTapMenu Scroll
            tapBarCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        }
    }
}


