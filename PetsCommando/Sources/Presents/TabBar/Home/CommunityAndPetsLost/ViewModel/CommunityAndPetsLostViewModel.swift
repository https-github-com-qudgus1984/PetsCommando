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
    private weak var coordinator: CommunityAndPetsLostCoordinator?
    init(coordinator: CommunityAndPetsLostCoordinator?) {
        self.coordinator = coordinator
    }
}
