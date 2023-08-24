//
//  CustomViewController.swift
//  SeSACWeek6
//
//  Created by Eunbee Kang on 2023/08/24.
//

import UIKit
import SnapKit

class CustomViewController: UIViewController {
    
    let idTextField = {
        let textField = BlackRadiusTextField()
        textField.placeholder = "아이디를 입력하세요."
        
        return textField
    }()
    
    let passwordTextField = {
        let textField = BlackRadiusTextField()
        textField.placeholder = "비밀번호를 입력하세요."

        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configLayout()
    }
    
    func configLayout() {
        view.backgroundColor = .white
        
        view.addSubview(idTextField)
        idTextField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(20)
            make.centerX.equalTo(idTextField)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
    }

}
