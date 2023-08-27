//
//  CustomTableViewController.swift
//  SeSACWeek6
//
//  Created by Eunbee Kang on 2023/08/24.
//

import UIKit
import SnapKit

struct Sample{
    let text: String
    var isExpanded: Bool
}

class CustomTableViewController: UIViewController {

    // viewDidLoad보다 클로저 구문이 먼저 실행됨
    // CustomTableViewController 인스턴스 생성 직전에 클로저 구문이 먼저 실행됨
    // let -> lazy var로 지연 초기화
    lazy var tableView = {
        let view = UITableView()
        view.rowHeight = UITableView.automaticDimension
        view.delegate = self // self: 자기 자신의 인스턴스
        view.dataSource = self
        
        view.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        
        return view
    }()
    
    let imageView = {
        // label, textfield, button 등에서는 frame 포함 필요 없었음
        // UIView, UIImageView는 컨텐츠 채워넣기 위한 subView를 가지고 있기 때문
        let view = PosterImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        return view
    }()
    
    
//    var isExpanded = false
    
    var list = [
        Sample(text: "테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트테스트 셀 텍스트", isExpanded: false),
        Sample(text: "asdfghjkjkl;qewuoicbvnzm,xcnasdfghjkjkl;qewuoicbvnzm,xcnasdfghjkjkl;qewuoicbvnzm,xcnoicbvnzm,xcn", isExpanded: false),
        Sample(text: "테스트 텍스트 테스트 텍스트 테스트 텍스트 테스트 텍스트 테스트 텍스트 테스트 텍스트 테스트 텍스트 테스트 텍스트 ", isExpanded: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configLayout()
    }
    
    func configLayout() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            print("constraints")
            make.size.equalTo(200)
            make.center.equalTo(view)
        }
    }
}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.label.text = list[indexPath.row].text
        cell.label.numberOfLines = list[indexPath.row].isExpanded ? 0 : 2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        list[indexPath.row].isExpanded.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
