//
//  DetailViewController.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 10.11.2023.
//

import UIKit
import TinyConstraints
import SDWebImage

final class DetailViewController: UIViewController, DetailViewProtocol {
    
    var presenter: DetailPresenterProtocol?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .regular, size: 26)
        label.textColor = .black
        return label
    }()
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .top
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    private let weatherInfoView = InfoView()
    private let windSpeedInfoView = InfoView()
    private let humidityInfoView = InfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        presenter?.load()
    }
    
    func handleOutput(_ output: DetailPresenterOutput) {
        switch output {
        case .showInfo(let weatherInfoModel):
            configureInfoWith(model: weatherInfoModel)
        }
    }
}

// MARK: - AddSubviews
extension DetailViewController {
    
    private func addSubviews() {
        addTitleLabel()
        addInfoStackView()
    }
    
    private func addTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.topToSuperview(offset: 20, usingSafeArea: true)
        titleLabel.centerXToSuperview()
    }
    
    private func addInfoStackView() {
        view.addSubview(infoStackView)
        infoStackView.topToBottom(of: titleLabel, offset: 20)
        infoStackView.horizontalToSuperview(insets: .horizontal(20))
        infoStackView.addArrangedSubview(weatherInfoView)
        infoStackView.addArrangedSubview(windSpeedInfoView)
        infoStackView.addArrangedSubview(humidityInfoView)
    }
}

// MARK: - ConfigureContents
extension DetailViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
    }
    
    private func configureInfoWith(model: WeatherInfoModel) {
        titleLabel.text = "Hava Durumu"
        weatherInfoView.setView(image: UIImage(systemName: "thermometer.sun")!,
                                value: String(Int(model.main?.temp ?? 0)).appending("ºC"),
                                info: model.weather?.first?.description?.capitalized ?? "")
        
        windSpeedInfoView.setView(image: UIImage(systemName: "wind")!,
                                  value: String(model.wind?.speed ?? 0).appending("km/s"),
                                  info: "Ruzgar Hizi")
        humidityInfoView.setView(image: UIImage(systemName: "humidity")!,
                                 value: String(Int(model.main?.humidity ?? 0)).appending("%"),
                                 info: "Nem Orani")
    }
}

// MARK: - Actions
extension DetailViewController {
    
    @objc
    private func close() {
        navigationController?.dismiss(animated: true)
    }
}
