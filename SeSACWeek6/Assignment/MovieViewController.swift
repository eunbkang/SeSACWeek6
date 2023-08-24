//
//  MovieViewController.swift
//  SeSACWeek6
//
//  Created by Eunbee Kang on 2023/08/24.
//

import UIKit
import SnapKit

class MovieViewController: UIViewController {

    // MARK: - Properties
    
    let backgroundImageiew: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "어벤져스엔드게임")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let gradientImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let logoLabel: UILabel = {
        let label = UILabel()
        label.text = "N"
        label.font = .systemFont(ofSize: 48, weight: .black)
        label.textColor = .white
        
        return label
    }()
    
    lazy var tvButton: UIButton = {
        let button = UIButton()
        self.configButton(button, title: "TV프로그램", image: nil)
        
        return button
    }()
    
    lazy var movieButton: UIButton = {
        let button = UIButton()
        self.configButton(button, title: "영화", image: nil)
        
        return button
    }()
    
    lazy var contentsButton: UIButton = {
        let button = UIButton()
        self.configButton(button, title: "내가 찜한 콘텐츠", image: nil)
        
        return button
    }()
    
    lazy var topMenuStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [tvButton, movieButton, contentsButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = -37
        
        return stackView
    }()
    
    lazy var topStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [logoLabel, topMenuStackView])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 24
        
        return stackView
    }()
    
    lazy var firstPreviewImageView: UIImageView = {
        let imageView = PreviewImageView(frame: CGRectZero)
        imageView.image = UIImage(named: "겨울왕국")
        
        return imageView
    }()
    
    lazy var secondPreviewImageView: UIImageView = {
        let imageView = PreviewImageView(frame: CGRectZero)
        imageView.image = UIImage(named: "광해")
        
        return imageView
    }()
    
    lazy var thirdPreviewImageView: UIImageView = {
        let imageView = PreviewImageView(frame: CGRectZero)
        imageView.image = UIImage(named: "아바타")
        
        return imageView
    }()
    
    lazy var previewStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstPreviewImageView, secondPreviewImageView, thirdPreviewImageView])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    let previewLabel: UILabel = {
        let label = UILabel()
        label.text = "미리보기"
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .white
        
        return label
    }()
    
    lazy var likedContentsButton: UIButton = {
        let button = UIButton()
        self.configButton(button, title: "내가 찜한 콘텐츠", image: "checkmark")
        
        return button
    }()
    
    lazy var infoButton: UIButton = {
        let button = UIButton()
        self.configButton(button, title: "정보", image: "info.circle")
        
        return button
    }()
    
    lazy var playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "play_normal"), for: .normal)
        
        return button
    }()
    
    lazy var middleButtonStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [likedContentsButton, playButton, infoButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 24
        
        return stackView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configLayout()
    }

    // MARK: - Helpers
    
    func configLayout() {
        view.backgroundColor = .black
        
        let viewList = [backgroundImageiew, gradientImageView, topStackView, previewStackView, previewLabel, middleButtonStack]
        for item in viewList {
            view.addSubview(item)
        }
        
        backgroundImageiew.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(backgroundImageiew).multipliedBy(3/2)
        }
        
        gradientImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(backgroundImageiew)
        }
        
        topStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view).inset(16)
        }
        
        let previewList = [firstPreviewImageView, secondPreviewImageView, thirdPreviewImageView]
        for item in previewList {
            item.snp.makeConstraints { make in
                make.size.equalTo(110)
            }
        }
        
        previewStackView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view).inset(16)
        }
        
        previewLabel.snp.makeConstraints { make in
            make.bottom.equalTo(previewStackView.snp.top).offset(-8)
            make.leading.equalTo(view).offset(16)
        }
        
        middleButtonStack.snp.makeConstraints { make in
            make.bottom.equalTo(previewLabel.snp.top).offset(-36)
            make.centerX.equalTo(view)
        }
    }
    
    func configButton(_ button: UIButton, title: String?, image: String?, imageSize: CGFloat = 15) {
        var config = UIButton.Configuration.plain()
    
        if let title {
            var titleAttr = AttributedString.init(title)
            titleAttr.font = .preferredFont(forTextStyle: .subheadline)
    
            config.attributedTitle = titleAttr
        }
    
        if let image {
            config.image = UIImage(systemName: image, withConfiguration: UIImage.SymbolConfiguration(pointSize: imageSize))
            config.imagePlacement = .top
            config.imagePadding = 8
        }
    
        config.baseForegroundColor = .white
        config.background.backgroundColor = .clear
        config.cornerStyle = .fixed
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    
        button.configuration = config
    }
}
