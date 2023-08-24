//
//  SignUpTextField.swift
//  SeSACWeek6
//
//  Created by Eunbee Kang on 2023/08/24.
//

import UIKit

class SignUpTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configView() {
        font = .systemFont(ofSize: 15, weight: .semibold)
        textColor = .white
        backgroundColor = .darkGray
        borderStyle = .roundedRect
        textAlignment = .center
    }
}
