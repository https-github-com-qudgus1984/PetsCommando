//
//  ViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/15.
//

import UIKit

class ViewController: UIViewController {

    var collectionView: UICollectionView!
    var tabs = ["Tab 1", "Tab 2", "Tab 3"]

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TabCell.self, forCellWithReuseIdentifier: "TabCell")
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false

        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabs.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCell", for: indexPath) as! TabCell
        cell.titleLabel.text = tabs[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (tabs[indexPath.row] as NSString).size(withAttributes: [.font: UIFont.systemFont(ofSize: 16)])
        return CGSize(width: size.width + 20, height: collectionView.bounds.height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Handle tab selection
    }
}
