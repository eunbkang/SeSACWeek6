//
//  PreviewImageView.swift
//  SeSACWeek6
//
//  Created by Eunbee Kang on 2023/08/24.
//

import UIKit

class PreviewImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configView() {
        contentMode = .scaleAspectFill
        
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 3
        
        layer.cornerRadius = 55
        clipsToBounds = true
    }
}
