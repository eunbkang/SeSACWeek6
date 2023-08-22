//
//  ViewController.swift
//  SeSACWeek6
//
//  Created by Eunbee Kang on 2023/08/21.
//

import UIKit

// 스토리보드 방식: 객체 얹기, 레이아웃 잡기, 아웃렛 연결, 속성 조절

// 코드베이스:
// 1. 뷰객체 프로퍼티 선언(클래스 인스턴스 생성)
// 2. 명시적으로 루트뷰에 추가 ( + translatesAutoresizingMaskIntoConstraints)
// 3. 크기와 위치 정의
// 4. 속성 정의
// Frame의 한계
// AutoRisizingMask, AutoLayout => 스토리보드 대응
// NSLayoutConstraints => 코드베이스 대응
    // 1) isActive 설정
    // 2) addConstraints

class ViewController: UIViewController {
    
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let signUpButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        emailTextField.frame = CGRect(x: 50, y: 80, width: UIScreen.main.bounds.width - 100, height: 50)
        
        emailTextField.backgroundColor = .lightGray
        emailTextField.placeholder = "이메일을 입력해주세요."
        
        //isActive
//        NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50).isActive = true
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50).isActive = true
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60).isActive = true
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        
        //addContraints
        let leading = NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50)
        let trailing = NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50)
        let height = NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60)
        let top = NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 20)
        
        view.addConstraints([leading, trailing, height, top])
        
        
        
        
        
        passwordTextField.backgroundColor = .red
        
        configSignUpButtonWithLayoutAnchor()
        
    }
    
    @objc func tappedSignUpButton() {
        let vc = LocationViewController()
        
        present(vc, animated: true)
    }
    
    func configSignUpButtonWithLayoutAnchor() {
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        signUpButton.backgroundColor = .systemPink
        signUpButton.addTarget(self, action: #selector(tappedSignUpButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalToConstant: 300),
            signUpButton.heightAnchor.constraint(equalToConstant: 48),
            signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

