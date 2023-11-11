//
//  InfoTableViewCell.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 11.11.2023.
//

import UIKit

final class InfoTableViewCell: UITableViewCell {
    
    private let windInfoView = InfoView()
    private let humidityInfoView = InfoView()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .top
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setCell() {
        
    }
}

// MARK: - UILayout
extension InfoTableViewCell {
    
    private func addSubviews() {
        addStackView()
    }
    
    private func addStackView() {
        contentView.addSubview(stackView)
        stackView.edgesToSuperview()
        stackView.addArrangedSubview(windInfoView)
        stackView.addArrangedSubview(humidityInfoView)
    }
}

// MARK: - ConfigureContents
extension InfoTableViewCell {
    
    private func configureContents() {
        windInfoView.title = "Ruzgar Hizi"
        windInfoView.icon = UIImage(systemName: "wind")!
        windInfoView.iconColor = .red
        
        humidityInfoView.title = "Nem Orani"
        humidityInfoView.icon = UIImage(systemName: "humidity")!
        humidityInfoView.iconColor = .red
    }
}
