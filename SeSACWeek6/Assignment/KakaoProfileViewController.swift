//
//  KakaoProfileViewController.swift
//  SeSACWeek6
//
//  Created by Eunbee Kang on 2023/08/22.
//

import UIKit

class KakaoProfileViewController: UIViewController {
    
    // MARK: - Properties
    
    let topRightButtonImageSize: CGFloat = 17
    let bottomButtonImageSize: CGFloat = 17
    
    let backgroundImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "nightSky")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let xmarkImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "xmark")
        imageView.tintColor = .white
        return imageView
    }()
    
    lazy var giftButton = {
        let button = UIButton()
        self.configBottomButton(button, title: nil, image: "gift.circle", imageSize: topRightButtonImageSize)
        
        return button
    }()
    
    lazy var diceButton = {
        let button = UIButton()
        self.configBottomButton(button, title: nil, image: "circle.grid.3x3.circle", imageSize: topRightButtonImageSize)
        
        return button
    }()
    
    lazy var settingButton = {
        let button = UIButton()
        self.configBottomButton(button, title: nil, image: "gearshape.circle", imageSize: topRightButtonImageSize)
        
        return button
    }()
    
    let profileImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "minions")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 24
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nicknameLabel = {
        let label = UILabel()
        label.text = "Jack"
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .white
        return label
    }()
    
    lazy var chattingButton = {
        let button = UIButton()
        self.configBottomButton(button, title: "나와의 채팅", image: "bubble.left.fill", imageSize: bottomButtonImageSize)
        
        return button
    }()
    
    lazy var editProfileButton = {
        let button = UIButton()
        self.configBottomButton(button, title: "프로필 편집", image: "pencil.line", imageSize: bottomButtonImageSize)
        
        return button
    }()
    
    lazy var kakaoStoryButton = {
        let button = UIButton()
        self.configBottomButton(button, title: "카카오스토리", image: "quote.closing", imageSize: bottomButtonImageSize)
        
        return button
    }()
    
    lazy var topRightStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [giftButton, diceButton, settingButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        
        return stackView
    }()
    
    lazy var bottomStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [chattingButton, editProfileButton, kakaoStoryButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 28
        
        return stackView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configLayoutConstraints()
    }
    
    // MARK: - Helpers
    
    func configBottomButton(_ button: UIButton, title: String?, image: String, imageSize: CGFloat) {
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
    
    func configLayoutConstraints() {
        let viewList = [backgroundImageView, xmarkImageView, topRightStackView, profileImageView, nicknameLabel, bottomStackView]
        for item in viewList {
            view.addSubview(item)
        }
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        xmarkImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view).offset(16)
        }
        
        topRightStackView.snp.makeConstraints { make in
            make.centerY.equalTo(xmarkImageView)
            make.trailing.equalTo(view).offset(-16)
        }
        
        bottomStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottomMargin.equalTo(view.safeAreaLayoutGuide).offset(-40)
        }
        
        nicknameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bottomStackView.snp.top).offset(-80)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.width.height.equalTo(80)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(nicknameLabel.snp.top).offset(-16)
        }
        
    }
}
