//
//  Coordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/04.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
