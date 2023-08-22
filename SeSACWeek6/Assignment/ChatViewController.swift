//
//  ChatViewController.swift
//  SeSACWeek6
//
//  Created by Eunbee Kang on 2023/08/22.
//

import UIKit
import SnapKit

class ChatViewController: UIViewController {

    // MARK: - Properties
    
    let backgroundImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "nightSky")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "10월 24일 09시 42분"
        label.font = .preferredFont(forTextStyle: .footnote)
        label.textColor = .white
        
        return label
    }()
    
    let locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "location.fill")
        imageView.tintColor = .white
        
        return imageView
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "서울, 신림동"
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .white
        
        return label
    }()
    
    lazy var locationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationImageView, locationLabel])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        
        return stackView
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton()
        self.configButton(button, title: nil, image: "square.and.arrow.up", imageSize: 15)
        
        return button
    }()
    
    lazy var refreshButton: UIButton = {
        let button = UIButton()
        self.configButton(button, title: nil, image: "arrow.clockwise", imageSize: 15)
        
        return button
    }()
    
    lazy var topRightStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [shareButton, refreshButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 24
        
        return stackView
    }()
    
    lazy var firstChatLabel: UILabel = {
        let label = UILabel()
        label.text = "지금은 9℃ 예요"
        configChatLabel(label)
        configChatView(label)
        
        return label
    }()
    
    lazy var secondChatLabel: UILabel = {
        let label = UILabel()
        label.text = "78% 만큼 습해요"
        configChatLabel(label)
        configChatView(label)
        
        return label
    }()
    
    lazy var thirdChatLabel: UILabel = {
        let label = UILabel()
        label.text = "1m/s의 바람이 불어요"
        configChatLabel(label)
        configChatView(label)
        
        return label
    }()
    
    lazy var fourthChatLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘도 행복한 하루 보내세요"
        configChatLabel(label)
        configChatView(label)
        
        return label
    }()
    
    lazy var cloudImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cloudEmoticon")
        configChatView(imageView)
        configChatImage(imageView)
        
        return imageView
    }()
    
    lazy var chatStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstChatLabel, secondChatLabel, thirdChatLabel, cloudImageView, fourthChatLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 16
        
        return stackView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configLayoutConstraints()
    }
    
    // MARK: - Helpers
    
    func configLayoutConstraints() {
        let viewList = [backgroundImageView, dateLabel, locationStackView, topRightStackView, chatStackView]
        for item in viewList {
            view.addSubview(item)
        }
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
        }
        
        locationStackView.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(16)
            make.leading.equalTo(dateLabel.snp.leading)
        }
        
        topRightStackView.snp.makeConstraints { make in
            make.centerY.equalTo(locationStackView)
            make.trailing.equalTo(view).offset(-24)
        }
        
        chatStackView.snp.makeConstraints { make in
            make.leading.equalTo(dateLabel.snp.leading)
            make.trailing.lessThanOrEqualTo(view).offset(-24)
            make.top.equalTo(locationStackView.snp.bottom).offset(24)
        }
    }
    
    func configChatLabel(_ label: UILabel) {
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.numberOfLines = 0
        
        label.heightAnchor.constraint(equalToConstant: label.intrinsicContentSize.height + 20).isActive = true
        label.widthAnchor.constraint(equalToConstant: label.intrinsicContentSize.width + 20).isActive = true
    }
    
    func configChatImage(_ imageView: UIImageView) {
        let width = view.frame.width * 0.4
        let height = width * 2/3
        
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        imageView.contentMode = .scaleAspectFit
    }

    func configChatView(_ view: UIView) {
        view.backgroundColor = .white
        
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
    }
    
    func configButton(_ button: UIButton, title: String?, image: String, imageSize: CGFloat) {
        var config = UIButton.Configuration.plain()
        
        if let title {
            var titleAttr = AttributedString.init(title)
            titleAttr.font = .preferredFont(forTextStyle: .subheadline)
            
            config.attributedTitle = titleAttr
        }
            
        config.image = UIImage(systemName: image, withConfiguration: UIImage.SymbolConfiguration(pointSize: imageSize))
        config.imagePlacement = .top
        config.imagePadding = 16
        
        config.baseForegroundColor = .white
        config.background.backgroundColor = .clear
        config.cornerStyle = .fixed
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        button.configuration = config
    }

}
