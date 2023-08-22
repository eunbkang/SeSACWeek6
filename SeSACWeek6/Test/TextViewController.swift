//
//  TextViewController.swift
//  SeSACWeek6
//
//  Created by Eunbee Kang on 2023/08/22.
//

import UIKit

class TextViewController: UIViewController {
    
    let photoImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemMint
        imageView.contentMode = .scaleAspectFill
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
