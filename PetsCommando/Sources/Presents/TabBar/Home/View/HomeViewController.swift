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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTopicViewController()
    }
    
    override func loadView() {
        self.view = homeView
    }
    
    
    func topic(_ viewController: TopicViewController, didSelectItem: Community) {
        print("a")
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
}
