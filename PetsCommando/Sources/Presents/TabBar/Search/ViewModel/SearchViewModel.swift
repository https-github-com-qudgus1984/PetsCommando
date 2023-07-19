//
//  SearchViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/19.
//

import Foundation
import RxCocoa
import RxSwift

final class SearchViewModel {
    private weak var coordinator: SearchCoordinator?
    init(coordinator: SearchCoordinator?) {
        self.coordinator = coordinator
    }
}
