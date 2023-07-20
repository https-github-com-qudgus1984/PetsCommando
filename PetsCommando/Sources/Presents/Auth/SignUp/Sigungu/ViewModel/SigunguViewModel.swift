//
//  SigunguViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/20.
//

import Foundation
import RxCocoa
import RxSwift

final class SigunguViewModel: ViewModelType {
    private weak var coordinator: AuthCoordinator?
    private var regionUseCase: RegionUseCase
    private let userDefaults = UserDefaults.standard
    
    init(coordinator: AuthCoordinator?, regionUseCase: RegionUseCase) {
        self.coordinator = coordinator
        self.regionUseCase = regionUseCase
    }
    
    let sigunguList = PublishRelay<[String]>()
    
    struct Input {
        let viewDidLoad: Observable<Void>
        let sigunguCellSelected: PublishSubject<IndexPath>

    }

    struct Output {
        let sigunguList: PublishRelay<[String]>
    }
        
    var disposeBag = DisposeBag()

    func transform(_ input: Input) -> Output {
        input.viewDidLoad.bind { [weak self] _ in
            guard let self else { return }
            self.getsigunguList()
        }
        .disposed(by: disposeBag)
        
        input.sigunguCellSelected.bind { [weak self] _ in
            guard let self else { return }
            self.coordinator?.showSignupFinishViewController()
        }
        .disposed(by: disposeBag)
        
        return Output(sigunguList: self.sigunguList)
    }
}

extension SigunguViewModel {
    private func getsigunguList() {
        Task {
            guard let sidoName = userDefaults.string(forKey: "sido") else { return }
            let sigunguList = try await regionUseCase.excuteSigunguList(query: SigunguListQuery(sidoName: sidoName))
            print(sigunguList, "시군구 받아오기 완료")
            self.sigunguList.accept(sigunguList.sigunguList)
        }
    }
}
