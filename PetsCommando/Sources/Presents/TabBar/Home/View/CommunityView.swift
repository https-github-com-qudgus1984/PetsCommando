//
//  CummunityView.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/06.
//

import UIKit
import SnapKit

final class CommunitryView: BaseView {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(CommunitryTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func configureUI() {
        [tableView].forEach {
            self.addSubview($0)
        }
    }
    
    override func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(80)
        }
    }
}
