//
//  HomeViewController.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 9.11.2023.
//

import UIKit
import TinyConstraints
import Kingfisher

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
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .semiBold, size: 36)
        label.textColor = .darkGray
        return label
    }()
    
    private let weatherInfoLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .thin, size: 12)
        label.textColor = .red
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        presenter?.load()
    }
    
    func handleOutput(_ output: HomePresenterOutput) {
        switch output {
        case .setLoading(let isLoading):
            print("IsLoading: \(isLoading)")
        case .showInfo(let weatherInfoModel):
            self.weatherInfoModel = weatherInfoModel
            configureWeatherInfo()
        case .showList(let weatherListModel):
            self.weatherListModel = weatherListModel
            tableView.reloadData()
            if let count = weatherListModel.list?.count {
                tableViewHeightConstraint?.constant = CGFloat(tableView.rowHeight * CGFloat(count))
                tableView.layoutIfNeeded()
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
        cityNameLabel.height(44)
        todayLabel.height(44)
    }
    
    private func addImageView() {
        scrollView.addSubview(imageView)
        imageView.topToBottom(of: cityStackView, offset: 120)
        imageView.centerXToSuperview()
        imageView.size(.init(width: 120, height: 80))
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
//        tableViewHeightConstraint = tableView.height(200)
    }
}

// MARK: - ConfigureContents
extension HomeViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
        configureScrollView()
        configureTableView()
    }
    
    private func configureWeatherInfo() {
        guard let model = weatherInfoModel else { return }
        cityNameLabel.text = model.name
        todayLabel.text = DateHelper.shared.currentDaySymbol(length: .full)
        if let icon = model.weather?.first?.icon {
            imageView.kf.getImage(with: icon)
        }
        if let temp = model.main?.temp {
            temperatureLabel.text = String(Int(temp))
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
    
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.scrollView {
            if self.scrollView.contentOffset.y >= 320 {
                tableView.isScrollEnabled = true
                tableView.contentOffset.y = self.scrollView.contentOffset.y - 320
//                weatherInfoLabel.text = "\(data.cityName) | \(data.info)"
            } else {
                tableView.isScrollEnabled = false
                tableView.contentOffset.y = .zero
//                weatherInfoLabel.text = "Parcali Bulutlu"
            }
        }
        
        if scrollView == tableView {
            if tableView.contentOffset.y < 0 {
                tableView.isScrollEnabled = true
            } else {
                tableView.isScrollEnabled = false
            }
            print("TABLEVIEW")
        }
    }
    
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "5 GUNLUK TAHMIN"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Count: \(weatherListModel?.list?.count)")
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
//        let detailViewController = DetailBuilder.make()
//        let nav = UINavigationController(rootViewController: detailViewController)
//        present(nav, animated: true)
        presenter?.selectDayAt(indexPath: indexPath)
    }
}
