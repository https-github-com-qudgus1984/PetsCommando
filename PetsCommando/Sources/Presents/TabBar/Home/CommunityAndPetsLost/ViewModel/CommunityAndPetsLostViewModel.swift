//
//  CommunityAndPetsLostViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/07.
//

import Foundation
import RxCocoa
import RxSwift

final class CommunityAndPetsLostViewModel {
    weak var coordinator: TabmanCoordinator?
    init(coordinator: TabmanCoordinator?) {
        self.coordinator = coordinator
    }
}
