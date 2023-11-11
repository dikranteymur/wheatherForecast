//
//  InfoTableViewCell.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 11.11.2023.
//

import UIKit

final class TempUnitTableViewCell: UITableViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .regular, size: 12)
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setcell() {
        
    }
}

// MARK: - Subviews
extension TempUnitTableViewCell {
    
    private func addSubviews() {
        addTitleLabel()
        addIconImageView()
        addValueLabel()
    }
    
    private func addTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.leadingToSuperview(offset: 8)
        titleLabel.centerYToSuperview()
    }
    
    private func addIconImageView() {
        contentView.addSubview(iconImageView)
        iconImageView.trailingToSuperview(offset: -8)
        iconImageView.centerYToSuperview()
    }
    
    private func addValueLabel() {
        contentView.addSubview(valueLabel)
        valueLabel.trailingToLeading(of: iconImageView, offset: 12)
        valueLabel.centerYToSuperview()
    }
    
}

// MARK: - ConfigureContents
extension TempUnitTableViewCell {
    
    private func configureContents() {
        selectionStyle = .none
        titleLabel.text = "Birim"
        iconImageView.image = UIImage(systemName: "arrow.up.and.down.square.fill")!
    }
}
