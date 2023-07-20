//
//  PetsLostViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/19.
//

import Foundation
import RxSwift
import RxCocoa

final class PetsLostViewModel: ViewModelType {
    
    private weak var coordinator: TabmanCoordinator?
    private var organicAnimalUseCase: OrganicAnimalUseCase
    
    init(coordinator: TabmanCoordinator?, organicAnimalUseCase: OrganicAnimalUseCase) {
        self.coordinator = coordinator
        self.organicAnimalUseCase = organicAnimalUseCase
    }
    
    let organicAnimalList = PublishRelay<[List?]>()
    
    struct Input {
        let viewDidLoad: Observable<Void>
        let cellSelected: PublishSubject<Void>
    }
    
    struct Output {
        let organicAnimalList: PublishRelay<[List?]>
    }

    var disposeBag = DisposeBag()
    
    func transform(_ input: Input) -> Output {
        
        input.viewDidLoad.bind { [weak self] _ in
            guard let self else { return }
            guard let sido = UserDefaults.standard.string(forKey: "sido") else { return }
            guard let sigungu = UserDefaults.standard.string(forKey: "sigungu") else { return }
            self.getOrganicAnimalList(sido: sido, sigungu: sigungu)
        }
        .disposed(by: disposeBag)
        
        input.cellSelected
            .bind { [weak self] _ in
                guard let self else { return }
                self.coordinator?.showPetsLostDetailViewController()
            }
            .disposed(by: disposeBag)
        return Output(organicAnimalList: self.organicAnimalList)
    }
}

extension PetsLostViewModel {
    private func getOrganicAnimalList(sido: String, sigungu: String) {
        Task {
            let organicAnimalList = try await organicAnimalUseCase.excuteOrganicAnimalList(query: OrganicAnimalListQuery(sido: sido, sigungu: sigungu))
            print(organicAnimalList, "유기동물 리스트 조회")
            self.organicAnimalList.accept(organicAnimalList.list)
        }
    }
}
