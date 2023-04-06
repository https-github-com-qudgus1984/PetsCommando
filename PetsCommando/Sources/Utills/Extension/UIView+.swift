//
//  UIView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/03.
//

import UIKit.UIView

extension UIView {

    func addShadow(radius: CGFloat) {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = .zero
    }
}
