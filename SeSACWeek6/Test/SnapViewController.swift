//
//  SnapViewController.swift
//  SeSACWeek6
//
//  Created by Eunbee Kang on 2023/08/22.
//

import UIKit
import SnapKit

/*
 1. addSubview 위치
 2. Superview
 3. offset, inset
 4. RTL(Right to Left) 대응을 위한 leading vs left
 */

class SnapViewController: UIViewController {

    let redView = UIView()
    let whiteView = UIView()
    let blueView = UIView()
    let yellowView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        
        view.addSubview(redView)
        redView.backgroundColor = .red
        redView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(100)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(whiteView)
        whiteView.backgroundColor = .white
        whiteView.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide)
//            make.leading.equalTo(view.safeAreaLayoutGuide)
//            make.trailing.equalTo(view.safeAreaLayoutGuide)
//            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(200)
        }
        
        view.addSubview(blueView)
        blueView.backgroundColor = .blue
        blueView.snp.makeConstraints { make in
//            make.width.height.equalTo(200)
            make.size.equalTo(200)
//            make.centerX.centerY.equalTo(view)
            make.center.equalTo(view)
        }
        
        blueView.addSubview(yellowView)
        yellowView.backgroundColor = .yellow
        yellowView.snp.makeConstraints { make in
//            make.size.equalTo(150)
//            make.leading.top.equalToSuperview()
            
//            make.leading.top.trailing.bottom.equalToSuperview()
//            make.edges.equalToSuperview()
            
//            make.edges.equalTo(blueView).offset(50)
            make.edges.equalTo(blueView).inset(50)
        }
    }
}
