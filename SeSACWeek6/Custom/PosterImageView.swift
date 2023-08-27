//
//  PosterImageView.swift
//  SeSACWeek6
//
//  Created by Eunbee Kang on 2023/08/25.
//

import UIKit

class PosterImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configView() {
        print(frame.width, frame)
        backgroundColor = .systemMint
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2
        
        clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        print("layoutSubView", frame.width, frame)
        layer.cornerRadius = frame.width / 2
    }
}
