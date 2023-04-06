//
//  HomeViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/08.
//

import UIKit

final class HomeViewController: BaseViewController, TopicViewControllerEvent {
    
    lazy var topicViewController: TopicViewController = {
        let topicViewController = TopicViewController()
        topicViewController.eventDelegate = self
        return topicViewController
    }()
    
    var topicDataStore = Community.allCases.map { $0 }
    
    private let viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("GenderViewController: fatal error")
    }
    
    let homeView = HomeView()
    let communitryView = CommunitryView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTopicViewController()
        configureCommunitryTableView()
    }
    
    override func loadView() {
        self.view = homeView
    }
    
    func topic(_ viewController: TopicViewController, didSelectItem: Community) {
        switch didSelectItem.rawValue {
        case 1:
            print("커뮤니티")
        case 2:
            print("유기동물리스트")
        default:
            print("쩌리짱")
        }
    }
    
    func configureTopicViewController() {
        addChild(topicViewController)
        view.addSubview(topicViewController.view)
        topicViewController.view.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(44)
        }
        topicViewController.didMove(toParent: self)
    }
    
    func configureCommunitryTableView() {
        communitryView.tableView.dataSource = self
        communitryView.tableView.delegate = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CommunitryTableViewCell else { return UITableViewCell() }
        return cell

    }
}
