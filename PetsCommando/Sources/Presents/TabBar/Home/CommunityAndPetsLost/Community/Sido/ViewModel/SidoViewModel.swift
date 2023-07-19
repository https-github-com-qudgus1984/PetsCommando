//
//  SidoViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/19.
//

import Foundation
import RxCocoa
import RxSwift

final class SidoViewModel {
    private weak var coordinator: CommunityAndPetsLostCoordinator?
    init(coordinator: CommunityAndPetsLostCoordinator?) {
        self.coordinator = coordinator
    }
}
