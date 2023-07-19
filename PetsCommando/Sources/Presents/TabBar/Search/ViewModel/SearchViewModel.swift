//
//  SearchViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/19.
//

import Foundation
import RxCocoa
import RxSwift
import CoreLocation

final class SearchViewModel: ViewModelType {
    private weak var coordinator: SearchCoordinator?
    init(coordinator: SearchCoordinator?) {
        self.coordinator = coordinator
    }
    
    struct Input {
        let locationButtonTapped: ControlEvent<Void>
        let viewDidLoad: BehaviorRelay<CLLocationCoordinate2D>
    }

    struct Output {
        let locationButtonTapped: ControlEvent<Void>
    }
    
    var disposeBag = DisposeBag()

    
    func transform(_ input: Input) -> Output {
        
        return Output(locationButtonTapped: input.locationButtonTapped)
    }
}
