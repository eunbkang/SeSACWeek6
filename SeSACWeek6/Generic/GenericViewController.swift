//
//  GenericViewController.swift
//  SeSACWeek6
//
//  Created by Eunbee Kang on 2023/08/24.
//

import UIKit
import SnapKit

class GenericViewController: UIViewController {
    
    let sampleLabel = UILabel()
    let sampleButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "네비게이션 타이틀"
        
        configUI()
    }
    
    func configUI() {
        view.backgroundColor = .yellow
        
        view.addSubview(sampleLabel)
        sampleLabel.backgroundColor = .red
        sampleLabel.text = "제네릭 테스트"
        configureBorder(view: sampleLabel)
        sampleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.height.equalTo(50)
        }
        
        view.addSubview(sampleButton)
        sampleButton.backgroundColor = .green
        configureBorder(view: sampleButton)
        sampleButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(sampleLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
    }
    
    func sumNumbers() {
        let intValue = sumInt(a: 3, b: 7)
        print(intValue)
        
        let doubleValue = sumDouble(a: 3.5, b: 7.7)
        print(doubleValue)
        
        let generic = sum(a: 3.44, b: 5.66)
        let genericInt = sum(a: 3, b: 7)
    }


}
