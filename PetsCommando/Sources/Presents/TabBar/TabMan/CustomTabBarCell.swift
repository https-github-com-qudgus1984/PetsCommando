//
//  CustomCell.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/15.
//

import UIKit

class CustomTabBarCell: UICollectionViewCell {

    var item: CustomTabBarItem? {
        didSet {
            titleLabel.text = item?.title
            titleLabel.textColor = isSelected ? .red : .gray
        }
    }

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    override var isSelected: Bool {
        didSet {
            titleLabel
