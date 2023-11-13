//
//  HomeProtocols.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 9.11.2023.
//

import Foundation

// MARK: - Interactor
protocol HomeInteractorProtocol {
    var delegate: HomeInteractorDelegate? { get set }
    func load()
    func loadWeatherList(city: String)
    func selectDayAt(indexPath: IndexPath)
}

enum HomeInteractorOutput {
    case showInfo(WeatherInfoModel)
    case showList(WeatherListModel)
    case showListDetail(WeatherInfoModel)
}

protocol HomeInteractorDelegate: AnyObject {
    func handleOutput(_ output: HomeInteractorOutput)
}

// MARK: - Presenter
protocol HomePresenterProtocol {
    func load()
    func loadWithCurrent(model: WeatherInfoModel)
    func loadWeatherInfoList(with city: String)
    func selectDayAt(indexPath: IndexPath)
    func openSearchView(delegate: SearchPresenterDelegate?)
}

enum HomePresenterOutput {
    case showInfo(WeatherInfoModel)
    case showList(WeatherListModel)
}

// MARK: - View
protocol HomeViewProtocol {
    func handleOutput(_ output: HomePresenterOutput)
}

// MARK: - Router
enum HomeRoute {
    case detail(model: WeatherInfoModel)
    case search(delegate: SearchPresenterDelegate?)
}

protocol HomeRouterProtocol {
    func navigate(to route: HomeRoute)
}

