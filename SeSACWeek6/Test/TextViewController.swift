//
//  TextViewController.swift
//  SeSACWeek6
//
//  Created by Eunbee Kang on 2023/08/22.
//

import UIKit

class TextViewController: UIViewController {
    
    //[Image] 1.
    let picker = UIImagePickerController()
    
    let photoImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemMint
//        imageView.contentMode = .scaleAspectFillㅇ
        return imageView
    }()
    // 뒤에 () 붙어있으므로 클로저 구문. 없으면 연산 프로퍼티
    
    let titleTextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = "제목을 입력하세요."
        textField.textAlignment = .center
        textField.font = .boldSystemFont(ofSize: 17)
        return textField
    }()
    
    let dateTextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = "날짜를 입력하세요."
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 15)
        return textField
    }()
    
    let contentTextView = {
        let textView = UITextView()
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 1
        textView.textAlignment = .natural
        textView.font = .systemFont(ofSize: 15)
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        view.backgroundColor = .white
        
        //1. 계층관계를 더 명확하게 알 수 있음
//        view.addSubview(photoImageView)
//        view.addSubview(titleTextField)
        
        //2. 반복문
        let viewList = [photoImageView, titleTextField, dateTextField, contentTextView]
        
        for item in viewList {
            view.addSubview(item)
        }
        
        //3. 클로저 구문 - 이렇게 할 수도 있음
//        [photoImageView, titleTextField].forEach { /* item in */
//            view.addSubview($0)
//        }
        
        configLayoutConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //[Image] 2. 권한 체크
//        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
//            print("갤러리 사용 불가. 여기에서 사용자에게 토스트/얼럿, 설정으로 이동 등")
//            return
//        }
//
//        picker.delegate = self
        
        //[Image] 이미지피커 뷰 타입 설정
//        picker.sourceType = .photoLibrary
//        picker.sourceType = .camera
//        picker.allowsEditing = true
        
        let picker = UIFontPickerViewController()
//        let picker = UIColorPickerViewController()
        
        present(picker, animated: true)
    }
    
    func configLayoutConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view).multipliedBy(0.3)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
            make.leading.equalTo(titleTextField.snp.leading)
            make.trailing.equalTo(titleTextField.snp.trailing)
            make.height.equalTo(titleTextField)
        }
        
        contentTextView.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp.bottom).offset(20)
            make.leading.equalTo(titleTextField.snp.leading)
            make.trailing.equalTo(titleTextField.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    

//    lazy var photoImageView = {
//        let imageView = UIImageView()
//
//        imageView.backgroundColor = .red
//        imageView.contentMode = .scaleAspectFill
//
//        return imageView
//    }()
//
//    func setImageView() -> UIImageView {
//        let imageView = UIImageView()
//
//        imageView.backgroundColor = .red
//        imageView.contentMode = .scaleAspectFill
//
//        return imageView
//    }
}

extension TextViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // UINavigationControllerDelegate: 피커 안에서 앨범 클릭 등 했을 때 네비게이션으로 이동하게 되므로 같이 호출
    
    // 취소 버튼 눌렀을 때
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    // 사진을 선택하거나 카메라 촬영 직후 호출
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.photoImageView.image = image
            dismiss(animated: true)
        }
    }
}
