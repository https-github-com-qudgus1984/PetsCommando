//
//  UITextField+Extension.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/04.
//

import UIKit

extension UITextField {
    
    public func addLineSpacing(spacing: CGFloat) {
        if let text = text {
            let attributeString = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            style.minimumLineHeight = spacing
            style.maximumLineHeight = spacing
            attributeString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSMakeRange(0, attributeString.length))
            self.attributedText = attributeString
        }
    }
    
    /// Custom Func
    func setupFont(type: UIFont) {
        addLineSpacing(spacing: 16 * 1.7)
    }
}
