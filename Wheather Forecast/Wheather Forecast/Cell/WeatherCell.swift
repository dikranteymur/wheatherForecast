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
    
    private var viewModel: CellViewModel?
    
    func setCell(viewModel: CellViewModel?) {
        self.viewModel = viewModel
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
        guard let viewModel = viewModel else { return }
        sepLabel.text = "/"
        dayLabel.text = viewModel.day
        weatherImageView.image = viewModel.icon
        minTempLabel.text = viewModel.minTem
        maxTempLabel.text = viewModel.maxTem
    }
}

struct CellViewModel {
    var day: String
    var icon: UIImage
    var minTem: String
    var maxTem: String
}

class CellDatas {
    static func getData() -> [CellViewModel] {
        return [CellViewModel(day: "Bugun", icon: UIImage(systemName: "sun.max.fill")!, minTem: "8", maxTem: "17"),
                CellViewModel(day: "Cmt", icon: UIImage(systemName: "cloud.fill")!, minTem: "12", maxTem: "20"),
                CellViewModel(day: "Paz", icon: UIImage(systemName: "cloud.rain.fill")!, minTem: "8", maxTem: "17"),
                CellViewModel(day: "Pzt", icon: UIImage(systemName: "cloud.sun.fill")!, minTem: "8", maxTem: "17"),
                CellViewModel(day: "Sal", icon: UIImage(systemName: "sun.max.fill")!, minTem: "8", maxTem: "17"),
                CellViewModel(day: "Car", icon: UIImage(systemName: "sun.max.fill")!, minTem: "8", maxTem: "17"),
                CellViewModel(day: "Per", icon: UIImage(systemName: "cloud.sun.fill")!, minTem: "8", maxTem: "17"),
                CellViewModel(day: "Bugun", icon: UIImage(systemName: "sun.max.fill")!, minTem: "8", maxTem: "17"),
                CellViewModel(day: "Cmt", icon: UIImage(systemName: "cloud.fill")!, minTem: "12", maxTem: "20"),
                CellViewModel(day: "Paz", icon: UIImage(systemName: "cloud.rain.fill")!, minTem: "8", maxTem: "17"),
                CellViewModel(day: "Pzt", icon: UIImage(systemName: "cloud.sun.fill")!, minTem: "8", maxTem: "17"),
                CellViewModel(day: "Sal", icon: UIImage(systemName: "sun.max.fill")!, minTem: "8", maxTem: "17"),
                CellViewModel(day: "Car", icon: UIImage(systemName: "sun.max.fill")!, minTem: "8", maxTem: "17")
        ]
    }
}
