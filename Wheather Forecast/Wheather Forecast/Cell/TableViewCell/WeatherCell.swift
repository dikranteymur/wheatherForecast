//
//  WeatherCell.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 9.11.2023.
//

import UIKit
import TinyConstraints

final class WeatherCell: UITableViewCell {
    
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .regular, size: 14)
        return label
    }()
    
    private let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let minTempLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .regular, size: 14)
        label.textColor = .gray
        return label
    }()
    
    private let sepLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .regular, size: 14)
        return label
    }()
    
    private let maxTempLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .regular, size: 12)
        label.textColor = .black
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private var model: WeatherInfoModel?
    private var date: String?
    
    func setCell(model: WeatherInfoModel?, date: String?) {
        self.model = model
        self.date = date
        configureContents()
    }
}

// MARK: - UILayout
extension WeatherCell {
    
    private func addSubviews() {
        addStackView()
    }
    
    private func addStackView() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(dayLabel)
        stackView.addArrangedSubview(weatherImageView)
        stackView.addArrangedSubview(minTempLabel)
        stackView.addArrangedSubview(sepLabel)
        stackView.addArrangedSubview(maxTempLabel)
        stackView.edgesToSuperview(insets: .uniform(20))
        weatherImageView.size(.init(width: 24, height: 24))
    }
}

// MARK: - ConfigureContents
extension WeatherCell {
    
    private func configureContents() {
        guard let model = model else { return }
        dayLabel.text = DateHelper.shared.getDaySymbolFromDateString(date: date)
        weatherImageView.image = UIImage()
        if let tempMin = model.main?.tempMin, let tempMax = model.main?.tempMax {
            minTempLabel.text = String(tempMin)
            maxTempLabel.text = String(tempMax)
            sepLabel.text = "/"
        }
    }
}
