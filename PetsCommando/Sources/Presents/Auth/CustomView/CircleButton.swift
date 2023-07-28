//
//  SelectionButton.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/03.
//

import UIKit.UIButton

enum Status {
    case search
    case plus

    var image: UIImage {
        switch self {
        case .search:
            return UIImage(systemName: "plus.magnifyingglass")!
        case .plus:
            return UIImage(systemName: "plus")!
        }
    }
}

final class CircleButton: UIButton {

    override init(frame: CGRect) { // 코드로 뷰가 생성될 때 생성자
        super.init(frame: frame)
    }

    convenience init(status: Status) {
        self.init()
        setConfiguration()
        setValidStatus(status: status)
    }

    required init?(coder: NSCoder) {
        fatalError("CircleButton: fatal Error Message")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = bounds.width / 2
    }

    func setConfiguration() {
        backgroundColor = Color.BaseColor.hunt3
        tintColor = .black
        clipsToBounds = true
        layer.cornerRadius = bounds.width / 2
        addShadow(radius: 2)
    }

    func setValidStatus(status: Status) {
        setImage(status.image, for: .normal)
    }
}
