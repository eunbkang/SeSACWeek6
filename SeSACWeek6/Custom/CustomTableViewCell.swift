//
//  CustomTableViewCell.swift
//  SeSACWeek6
//
//  Created by Eunbee Kang on 2023/08/25.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {

    let label = UILabel()
    let button = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configDesign()
        configLayoutConstraints() // addSubView 이후에 consraints 설정 필요
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configDesign() {
        contentView.addSubview(label)
        label.backgroundColor = .yellow
        
        contentView.addSubview(button)
        button.backgroundColor = .green
    }
    
    func configLayoutConstraints() {
        button.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.centerY.trailingMargin.equalTo(contentView)
        }
        
        label.snp.makeConstraints { make in
            make.top.leadingMargin.bottom.equalTo(contentView).inset(8)
            make.trailing.equalTo(button.snp.leading).offset(-16)
        }
    }
    
    // Interface Builder에서 제작했을 때 동작하는 코드
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
