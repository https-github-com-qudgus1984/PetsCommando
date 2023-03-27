//
//  UIViewController +.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/25.
//
import UIKit
import Toast

extension UIViewController {

    func makeToastStyle() {
        var style = ToastStyle()
        style.messageFont = Font.Body3_L12!
        style.messageColor = .white
        style.backgroundColor = .black
        style.titleAlignment = .center
        ToastManager.shared.style = style
    }
}
