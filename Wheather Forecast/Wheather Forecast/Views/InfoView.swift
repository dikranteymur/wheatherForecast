//
//  InfoView.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 11.11.2023.
//

import UIKit

final class InfoView: UIView {
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .semiBold, size: 22)
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .thin, size: 12)
        label.textColor = .darkGray
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 12
        return stackView
    }()
    
    var title: String {
        didSet {
            infoLabel.text = title
        }
    }
    
    var icon: UIImage {
        didSet {
            iconImageView.image = icon
        }
    }
    
    var iconColor: UIColor {
        didSet {
            iconImageView.tintColor = iconColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setView(image: UIImage, value: String, info: String) {
        iconImageView.image = image
        valueLabel.text = value
        infoLabel.text = info
    }
}

// MARK: - AddSubviews
extension InfoView {
    
    private func addSubviews() {
        addContentView()
        addStackView()
    }
    
    private func addContentView() {
        addSubview(contentView)
        contentView.edgesToSuperview()
    }
    
    private func addStackView() {
        contentView.addSubview(stackView)
        stackView.edgesToSuperview(insets: .uniform(20))
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(infoLabel)
        iconImageView.size(.init(width: 44, height: 44))
    }
}

// MARK: - ConfigureContents
extension InfoView {
    
    private func configureContents() {
         
    }
}
