//
//  CommunityDetailViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/10.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

final class PetsLostDetailViewController: BaseViewController {
    private let selfView = PetsLostDetailView()
    private let viewModel: PetsLostDetailViewModel
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("CommunityDetailViewController: fatal error")
    }
    
    //MARK: Delegate
    init(viewModel: PetsLostDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = selfView
    }
    
    let organicAnimal = BehaviorRelay<List?>(value: nil)
    
    override func setupBinding() {
        let input = PetsLostDetailViewModel.Input()
        let output = viewModel.transform(input)
        
        output.organicAnimal
            .bind { [weak self] organicAnimal in
                guard let self else { return }
                self.organicAnimal.accept(organicAnimal)
            }
            .disposed(by: self.disposeBag)
        
        self.organicAnimal
            .bind { [weak self] organicAnimal in
                guard let self else { return }
                guard let organicAnimal = organicAnimal else { return }
                selfView.animalTitleLabel.text = organicAnimal.kindCD
                selfView.ageExplainLabel.text = ": " + organicAnimal.age
                let imageURL = URL(string: organicAnimal.popfile)
                selfView.animalImageView.kf.setImage(with: imageURL)
                selfView.weightExplainLabel.text = ": " + organicAnimal.weight
                selfView.processStateExplainLabel.text = ": " + organicAnimal.processState
                if organicAnimal.sexCD == "M" {
                    selfView.genderExplainLabel.text = ": 남자"
                } else if organicAnimal.sexCD == "F" {
                    selfView.genderExplainLabel.text = ": 여자"
                } else {
                    selfView.genderExplainLabel.text = ": 미상"
                }
                selfView.shelterExplainLabel.text = ": " + organicAnimal.careNm
                selfView.shelterAdressExplainLabel.text = ": " + organicAnimal.careAddr
                selfView.phoneNumberExplainLabel.text = ": " + organicAnimal.careTel
                selfView.animalColorExplainLabel.text = ": " + organicAnimal.colorCD
                selfView.happenPlaceExplainLabel.text = ": " + organicAnimal.happenPlace
                selfView.specialExplainLabel.text = ": " + organicAnimal.specialMark
                
            }
            .disposed(by: disposeBag)
    }
}
