//
//  CreateCommunityViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/28.
//

import UIKit
import RxSwift
import RxCocoa
import Toast

final class CreateCommunityViewController: BaseViewController {
    
    let createCommunityView = CreateCommunityView()
    let viewModel: CreateCommunityViewModel
    
    //MARK: Delegate
    init(viewModel: CreateCommunityViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        self.navigationController?.navigationBar.scrollEdgeAppearance?.backgroundColor = Color.BaseColor.hunt4
    }
    
    override func loadView() {
        self.view = createCommunityView
    }
    
    override func setupBinding() {

        let input = CreateCommunityViewModel.Input(titleText: self.createCommunityView.titleTextField.rx.text, contentText: self.createCommunityView.textView.rx.text, registerButtonTap: self.createCommunityView.registerButton.rx.controlEvent(.touchUpInside)
            .map {
                DailyPostQuery(title: self.createCommunityView.titleTextField.text!, content: self.createCommunityView.textView.text!, photo: self.createCommunityView.imageAppealView.image?.jpegData(compressionQuality: 0.8) ?? Data())
            }
        )
        
        let output = viewModel.transform(input)
        
        output.postValid
            .withUnretained(self)
            .bind { vc, valid in
                print(valid)
                let buttonColor: UIColor = valid ? Color.BaseColor.hunt2 : Color.BaseColor.gray6
                vc.createCommunityView.registerContainView.backgroundColor = buttonColor
                vc.createCommunityView.registerButton
                    .isEnabled = valid
            }
            .disposed(by: disposeBag)
        
        output.dailyPostModel
            .withUnretained(self)
            .observe(on: MainScheduler.instance)
            .bind { vc, dailyPost in
                vc.view.makeToast("글이 작성되었습니다.", position: .top)
                vc.createCommunityView.updateFinishDailyPost()
                
            }
            .disposed(by: disposeBag)
        
        self.createCommunityView.imagePlusButton
            .rx.tap
            .withUnretained(self)
            .bind { vc, _ in
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                vc.present(imagePicker, animated: true)
            }
            .disposed(by: disposeBag)
        
        output.requestTextMessage.emit(onNext: {[unowned self] text in self.view.makeToast(text, position: .top)})
            .disposed(by: disposeBag)
    }
}

extension CreateCommunityViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.createCommunityView.updateProfileImage(image: pickedImage)
        }
        self.createCommunityView.explainImageLabel.isHidden = true
        self.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }
}
