//
//  LocationModifySigunguViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/21.
//

import Foundation
import RxCocoa
import RxSwift

final class LocationModifySigunguViewModel: ViewModelType {
    private weak var coordinator: MyProfileCoordinator?
    private var regionUseCase: RegionUseCase
    private let userDefaults = UserDefaults.standard
    
    init(coordinator: MyProfileCoordinator?, regionUseCase: RegionUseCase) {
        self.coordinator = coordinator
        self.regionUseCase = regionUseCase
    }
    
    let sigunguList = PublishRelay<[String]>()
    
    struct Input {
        let viewDidLoad: Observable<Void>
        let sigunguCellSelected: PublishSubject<IndexPath>
        let dataSetFinish: PublishRelay<Void>
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
        
        //MARK: 여기서 tabBarCoordinator 초기화시켜주어야함
        input.dataSetFinish.bind { [weak self] _ in
            guard let self else { return }
            self.coordinator?.restart()
            self.coordinator?.start()
        }
        .disposed(by: disposeBag)
        
        return Output(sigunguList: self.sigunguList)
    }
}

extension LocationModifySigunguViewModel {
    private func getsigunguList() {
        Task {
            guard let sidoName = userDefaults.string(forKey: "sido") else { return }
            let sigunguList = try await regionUseCase.excuteSigunguList(query: SigunguListQuery(sidoName: sidoName))
            print(sigunguList, "시군구 받아오기 완료")
            self.sigunguList.accept(sigunguList.sigunguList)
        }
    }
}
