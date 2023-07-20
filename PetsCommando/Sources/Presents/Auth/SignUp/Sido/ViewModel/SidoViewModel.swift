//
//  SidoViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/19.
//

import Foundation
import RxCocoa
import RxSwift

final class SidoViewModel: ViewModelType {
    private weak var coordinator: AuthCoordinator?
    private var regionUseCase: RegionUseCase
    private let userDefaults = UserDefaults.standard
    
    init(coordinator: AuthCoordinator?, regionUseCase: RegionUseCase) {
        self.coordinator = coordinator
        self.regionUseCase = regionUseCase
    }
    
    let sidoList = BehaviorRelay<[String]>(value: [])
    
    struct Input {
        let viewDidLoad: Observable<Void>
    }

    struct Output {
        let sidoList: BehaviorRelay<[String]>
    }
        
    var disposeBag = DisposeBag()

    func transform(_ input: Input) -> Output {
        input.viewDidLoad.bind { [weak self] _ in
            guard let self else { return }
            self.getSidoList()
        }
        .disposed(by: disposeBag)
        return Output(sidoList: self.sidoList)
    }
}

extension SidoViewModel {
    private func getSidoList() {
        Task {
            let sidoList = try await regionUseCase.excuteSidoList()
            print(sidoList, "시도 받아오기 완료")
            self.sidoList.accept(sidoList.sidoList)
        }
    }
}
