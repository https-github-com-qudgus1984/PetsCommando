//
//  LocationModifySidoViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/21.
//

import Foundation
import RxCocoa
import RxSwift

final class LocationModifySidoViewModel: ViewModelType {
    private weak var coordinator: MyProfileCoordinator?
    private var regionUseCase: RegionUseCase
    private let userDefaults = UserDefaults.standard
    
    init(coordinator: MyProfileCoordinator?, regionUseCase: RegionUseCase) {
        self.coordinator = coordinator
        self.regionUseCase = regionUseCase
    }
    
    let sidoList = PublishRelay<[String]>()
    
    struct Input {
        let viewDidLoad: Observable<Void>
        let sidoCellSelected: PublishSubject<IndexPath>
    }

    struct Output {
        let sidoList: PublishRelay<[String]>
    }
        
    var disposeBag = DisposeBag()

    func transform(_ input: Input) -> Output {
        input.viewDidLoad.bind { [weak self] _ in
            guard let self else { return }
            self.getSidoList()
        }
        .disposed(by: disposeBag)
        
        input.sidoCellSelected
            .bind { [weak self] _ in
                guard let self else { return }
                self.coordinator?.showLocationModifySigunguViewController()
            }
            .disposed(by: disposeBag)
        return Output(sidoList: self.sidoList)
    }
}

extension LocationModifySidoViewModel {
    private func getSidoList() {
        Task {
            let sidoList = try await regionUseCase.excuteSidoList()
            print(sidoList, "시도 받아오기 완료")
            self.sidoList.accept(sidoList.sidoList)
        }
    }
}

