//
//  CoordinatorDelegate.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/20.
//

import Foundation

protocol CoordinatorDelegate: AnyObject {

    func didFinish(childCoordinator: Coordinator)
}
