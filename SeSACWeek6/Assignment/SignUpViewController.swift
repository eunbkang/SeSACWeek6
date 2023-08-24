//
//  SignUpViewController.swift
//  SeSACWeek6
//
//  Created by Eunbee Kang on 2023/08/24.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    
    // MARK: - Properties
    
    let logoLabel: UILabel = {
        let label = UILabel()
        label.text = "JACKFLIX"
        label.font = .systemFont(ofSize: 28, weight: .black)
        label.textColor = .systemRed
        
        return label
    }()
    
    let emailTextField = {
        let textField = SignUpTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "이메일 주소 또는 전화번호", attributes: [.foregroundColor: UIColor.white])
        
        return textField
    }()
    
    let passwordTextField = {
        let textField = SignUpTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [.foregroundColor: UIColor.white])
        
        return textField
    }()
    
    let nicknameField = {
        let textField = SignUpTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "닉네임", attributes: [.foregroundColor: UIColor.white])
        
        return textField
    }()
    
    let locationField = {
        let textField = SignUpTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "위치", attributes: [.foregroundColor: UIColor.white])
        
        return textField
    }()
    
    let codeField = {
        let textField = SignUpTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "추천 코드 입력", attributes: [.foregroundColor: UIColor.white])
        
        return textField
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        
        var config = UIButton.Configuration.filled()
        
        var titleAttr = AttributedString.init("회원가입")
        titleAttr.font = .systemFont(ofSize: 17, weight: .bold)
        
        config.attributedTitle = titleAttr
        config.baseForegroundColor = .black
        config.background.backgroundColor = .white
        
        button.configuration = config
        
        return button
    }()
    
    let additionalInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "추가 정보 입력"
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .white
        
        return label
    }()
    
    let additionalInfoSwitch: UISwitch = {
        let view = UISwitch()
        view.onTintColor = .systemRed
        view.isOn = true
        
        return view
    }()
    
    lazy var additionalInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [additionalInfoLabel, additionalInfoSwitch])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        
        return stackView
    }()
    
    lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, nicknameField, locationField, codeField, signUpButton, additionalInfoStackView])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        
        return stackView
    }()
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configLayout()
    }
    
    // MARK: - Helpers

    func configLayout() {
        view.backgroundColor = .black
        
        let viewList = [logoLabel, textFieldStackView]
        for item in viewList {
            view.addSubview(item)
        }
        
        logoLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        textFieldStackView.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.horizontalEdges.equalTo(view).inset(40)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
    }

}
