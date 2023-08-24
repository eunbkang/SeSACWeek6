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

    let tableView = {
        let view = UITableView()
        view.rowHeight = UITableView.automaticDimension
        
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
        configTableView()
    }
    
    func configLayout() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
    }
}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell")!
        cell.selectionStyle = .none
        cell.textLabel?.text = list[indexPath.row].text
        cell.textLabel?.numberOfLines = list[indexPath.row].isExpanded ? 0 : 2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        isExpanded.toggle()
        list[indexPath.row].isExpanded.toggle()
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
    }
}
