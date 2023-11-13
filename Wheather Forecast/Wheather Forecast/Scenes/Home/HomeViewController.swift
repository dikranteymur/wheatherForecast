//
//  HomeViewController.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 9.11.2023.
//

import UIKit
import TinyConstraints
import SDWebImage

final class HomeViewController: UIViewController, HomeViewProtocol {
    
    var presenter: HomePresenterProtocol?
    
    private var weatherInfoModel: WeatherInfoModel? = nil
    private var weatherListModel: WeatherListModel? = nil
    
    private var tableViewHeightConstraint: Constraint?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.isScrollEnabled = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        tableView.showsVerticalScrollIndicator = false
        tableView.register(WeatherCell.self)
        return tableView
    }()
    
    private let cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .regular, size: 22)
        label.textColor = .black
        return label
    }()
    
    private let todayLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .light, size: 14)
        label.textColor = .black
        return label
    }()
    
    private let cityStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = sMargin
        return stackView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .semiBold, size: 78)
        label.textColor = .darkGray
        return label
    }()
    
    private let weatherInfoLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .light, size: 12)
        label.textColor = .black
        return label
    }()
    
    private let temperatureStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = sMargin
        return stackView
    }()
    
    private let infoView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        addObserver()
        presenter?.load()
    }
    
    func handleOutput(_ output: HomePresenterOutput) {
        switch output {
        case .showInfo(let weatherInfoModel):
            self.weatherInfoModel = weatherInfoModel
            configureWeatherInfo()
        case .showList(let weatherListModel):
            self.weatherListModel = weatherListModel
            tableView.reloadData()
            if let count = weatherListModel.list?.count {
                tableViewHeightConstraint?.constant = CGFloat(60.0 * CGFloat(count) + 44)
            }
        }
    }
}

// MARK: - UILayout
extension HomeViewController {
    
    private func addSubviews() {
        addScrollView()
        addCityStackView()
        addImageView()
        addTemperatureStackView()
        addTableView()
        addSearchButton()
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview(usingSafeArea: true)
        scrollView.width(to: view, relation: .equal)
        scrollView.height(to: view, relation: .equal, priority: .init(rawValue: 250))
    }
    
    private func addCityStackView() {
        scrollView.addSubview(cityStackView)
        cityStackView.addArrangedSubview(cityNameLabel)
        cityStackView.addArrangedSubview(todayLabel)
        cityStackView.topToSuperview(offset: 20)
        cityStackView.centerXToSuperview()
        cityNameLabel.height(32)
        todayLabel.height(32)
    }
    
    private func addImageView() {
        scrollView.addSubview(imageView)
        imageView.topToBottom(of: cityStackView, offset: 20)
        imageView.centerXToSuperview()
        imageView.size(.init(width: 60, height: 60))
    }
    
    private func addTemperatureStackView() {
        scrollView.addSubview(temperatureStackView)
        temperatureStackView.addArrangedSubview(temperatureLabel)
        temperatureStackView.addArrangedSubview(weatherInfoLabel)
        temperatureStackView.topToBottom(of: imageView, offset: 20, relation: .equalOrGreater)
        temperatureStackView.topToSuperview(offset: 20, priority: .init(750), usingSafeArea: true)
        temperatureStackView.centerXToSuperview()
    }
    
    private func addTableView() {
        scrollView.addSubview(tableView)
        tableView.topToBottom(of: temperatureStackView, offset: 20)
        tableView.bottomToSuperview()
        tableView.width(to: scrollView, relation: .equal)
        tableView.height(1000)
    }
    
    private func addSearchButton() {
        view.addSubview(searchButton)
        searchButton.topToSuperview(offset: 20, usingSafeArea: true)
        searchButton.trailingToSuperview(offset: 20)
        searchButton.size(.init(width: 44, height: 44))
    }
}

// MARK: - ConfigureContents
extension HomeViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
        configureScrollView()
        configureTableView()
        configureSearchButton()
        
    }
    
    private func configureWeatherInfo() {
        guard let model = weatherInfoModel else { return }
        cityNameLabel.text = model.name
        todayLabel.text = DateHelper.shared.currentDaySymbol(length: .full)
        if let icon = model.weather?.first?.icon {
            imageView.getImage(with: icon)
        }
        if let temp = model.main?.temp {
            temperatureLabel.text = String(Int(temp)).appending("ºC")
        }
        if let description = model.weather?.first?.description {
            weatherInfoLabel.text = description.capitalized
        }
    }
    
    private func configureScrollView() {
        scrollView.delegate = self
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureSearchButton() {
        searchButton.layer.zPosition = 3
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.scrollView {
            if self.scrollView.contentOffset.y >= 200 {
                tableView.isScrollEnabled = true
                tableView.contentOffset.y = self.scrollView.contentOffset.y - 200
                if let cityName = weatherInfoModel?.name, let info = weatherInfoModel?.weather?.first?.description {
                    weatherInfoLabel.text = "\(cityName) | \(info.capitalized)"
                }
            } else {
                tableView.isScrollEnabled = false
                tableView.contentOffset.y = .zero
                if let info = weatherInfoModel?.weather?.first?.description {
                    weatherInfoLabel.text = "\(info.capitalized)"
                }
            }
        }
        
        if scrollView == tableView {
            if tableView.contentOffset.y < 0 {
                tableView.isScrollEnabled = true
            } else {
                tableView.isScrollEnabled = false
            }
        }
    }
    
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListModel?.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WeatherCell.self), for: indexPath) as? WeatherCell {
            cell.setCell(model: weatherListModel?.list?[indexPath.row], date: weatherListModel?.date)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.selectDayAt(indexPath: indexPath)
    }
}

// MARK: - Observers
extension HomeViewController {
    
    private func addObserver() {
        NotificationCenter.addNotification(self, name: .requestWithLocation, selector: #selector(locationRequested))
    }
}

// MARK: - Actions
extension HomeViewController {

    
    @objc
    private func searchButtonTapped() {
        presenter?.openSearchView(delegate: self)
    }
    
    @objc
    private func locationRequested() {
        presenter?.load()
    }
}

// MARK: - SearchPresenterProtocol
extension HomeViewController: SearchPresenterDelegate {
    
    func handleHomeView(with model: WeatherInfoModel) {
        presenter?.loadWithCurrent(model: model)
        if let city = model.name {
            presenter?.loadWeatherInfoList(with: city)
        }
    }
}
