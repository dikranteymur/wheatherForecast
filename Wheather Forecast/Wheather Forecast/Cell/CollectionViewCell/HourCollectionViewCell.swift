//
//  HourCollectionViewCell.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 11.11.2023.
//

import UIKit

final class HourCollectionViewCell: UICollectionViewCell {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .regular, size: 12)
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .regular, size: 12)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setCell() {
        
    }
}

// MARK: - AddSubviews
extension HourCollectionViewCell {
    
    private func addSubviews() {
        addStackView()
    }
    
    private func addStackView() {
        contentView.addSubview(stackView)
        stackView.edgesToSuperview(insets: .uniform(20))
        stackView.addArrangedSubview(dayLabel)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(tempLabel)
        iconImageView.size(.init(width: 44, height: 44))
    }
}

// MARK: - ConfigureContents
extension HourCollectionViewCell {
    
    private func configureContents() {
        
    }
}
