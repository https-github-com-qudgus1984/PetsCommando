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
    private var hospitalUseCase: HospitalUseCase
    
    init(coordinator: SearchCoordinator?, hospitalUseCase: HospitalUseCase) {
        self.coordinator = coordinator
        self.hospitalUseCase = hospitalUseCase
    }
    
    struct Input {
        let locationButtonTapped: ControlEvent<Void>
        let viewDidLoad: BehaviorRelay<CLLocationCoordinate2D>
    }

    struct Output {
        let locationButtonTapped: ControlEvent<Void>
        let hospitalList: PublishRelay<[Hospital]>
    }
    
    let hospitalList = PublishRelay<[Hospital]>()
    
    var disposeBag = DisposeBag()
    
    func transform(_ input: Input) -> Output {
        
        input.viewDidLoad
            .bind { [weak self] xy in
                guard let self else { return }
                print(xy, "내좌표")
                self.getHospital()
            }
            .disposed(by: disposeBag)
        
        return Output(locationButtonTapped: input.locationButtonTapped, hospitalList: self.hospitalList)
    }
}

extension SearchViewModel {
    private func getHospital() {
        Task {
            let hospitalList = try await hospitalUseCase.excuteHospital()
            print(hospitalList, "동물병원 조회")
            self.hospitalList.accept(hospitalList)
        }
    }
}
