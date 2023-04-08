//
//  HomeViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/08.
//

import UIKit
/*
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
    private var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTopicViewController()
        configureTableView()
    }
    
    override func loadView() {
        self.view = homeView
    }
    
    func topic(_ viewController: TopicViewController, didSelectItem: Community) {
        switch didSelectItem.rawValue {
        case 1:
            configureCommunitryTableView()
        case 2:
            configurePetsLostTableView()
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
    
    func configureTableView() {
        tableView = UITableView()
        homeView.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(topicViewController.view.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    
    func configureCommunitryTableView() {
        let communityView = CommunitryView()
        self.tableView = communityView.tableView
        self.homeView.addSubview(self.tableView)
        self.tableView.snp.makeConstraints {
            $0.top.equalTo(topicViewController.view.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
    }

    
    func configurePetsLostTableView() {
        let communityView = PetsLostView()
        self.tableView = communityView.tableView
        self.homeView.addSubview(self.tableView)
        self.tableView.snp.makeConstraints {
            $0.top.equalTo(topicViewController.view.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()

    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case self.tableView:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CommunitryTableViewCell else { return UITableViewCell() }
            return cell
        case CommunitryView().tableView:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CommunitryTableViewCell else { return UITableViewCell() }
            return cell
        case PetsLostView().tableView:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? PetsLostTableViewCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
*/
