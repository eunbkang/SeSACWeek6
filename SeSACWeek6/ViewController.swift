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
    let chatButton = UIButton()
    
    let textViewButton = UIButton()
    let kakaoProfileButton = UIButton()

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
        configTextViewButtonWithLayoutAnchor()
        configKakaoProfileButtonWithLayoutAnchor()
        configChatButtonWithLayoutAnchor()
    }
    
    // MARK: - Actions
    
    @objc func tappedChatButton() {
        let vc = ChatViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func tappedKakaoProfileButton() {
        let vc = KakaoProfileViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func tappedTextViewButton() {
        let vc = TextViewController()
        
        present(vc, animated: true)
    }
    
    @objc func tappedSignUpButton() {
//        let vc = LocationViewController()
//        let nav = UINavigationController(rootViewController: vc)
//
//        present(nav, animated: true)
        
        // 클래스의 인스턴스가 아니라 클래스 자체(메타타입 구조체?)를 넘겨줌
        transition(viewController: GenericViewController.self, storyboard: "Main", style: .push)
    }
    
    // MARK: - Helpers
    
    func configSignUpButtonWithLayoutAnchor() {
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        signUpButton.backgroundColor = .systemPink
        signUpButton.setTitle("Location", for: .normal)
        signUpButton.addTarget(self, action: #selector(tappedSignUpButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalToConstant: 300),
            signUpButton.heightAnchor.constraint(equalToConstant: 48),
            signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configTextViewButtonWithLayoutAnchor() {
        view.addSubview(textViewButton)
        textViewButton.translatesAutoresizingMaskIntoConstraints = false
        
        textViewButton.backgroundColor = .systemMint
        textViewButton.setTitle("TextView", for: .normal)
        textViewButton.addTarget(self, action: #selector(tappedTextViewButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            textViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textViewButton.widthAnchor.constraint(equalTo: signUpButton.widthAnchor),
            textViewButton.heightAnchor.constraint(equalTo: signUpButton.heightAnchor),
            textViewButton.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -16)
        ])
    }
    
    func configKakaoProfileButtonWithLayoutAnchor() {
        view.addSubview(kakaoProfileButton)
        kakaoProfileButton.translatesAutoresizingMaskIntoConstraints = false
        
        kakaoProfileButton.backgroundColor = .systemIndigo
        kakaoProfileButton.setTitle("KakaoProfile", for: .normal)
        kakaoProfileButton.addTarget(self, action: #selector(tappedKakaoProfileButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            kakaoProfileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            kakaoProfileButton.widthAnchor.constraint(equalTo: signUpButton.widthAnchor),
            kakaoProfileButton.heightAnchor.constraint(equalTo: signUpButton.heightAnchor),
            kakaoProfileButton.bottomAnchor.constraint(equalTo: textViewButton.topAnchor, constant: -16)
        ])
    }
    
    func configChatButtonWithLayoutAnchor() {
        view.addSubview(chatButton)
        chatButton.translatesAutoresizingMaskIntoConstraints = false
        
        chatButton.backgroundColor = .systemOrange
        chatButton.setTitle("Chatting", for: .normal)
        chatButton.addTarget(self, action: #selector(tappedChatButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            chatButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chatButton.widthAnchor.constraint(equalTo: signUpButton.widthAnchor),
            chatButton.heightAnchor.constraint(equalTo: signUpButton.heightAnchor),
            chatButton.bottomAnchor.constraint(equalTo: kakaoProfileButton.topAnchor, constant: -16)
        ])
    }
}

