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
    func load(cityName: String)
    func selectDayAt(indexPath: IndexPath)
}

enum HomeInteractorOutput {
    case setLoading(Bool)
    case showInfo(WeatherInfoModel)
    case showList(WeatherListModel)
    case showListDetail(WeatherInfoModel)
    case showSearchScene
}

protocol HomeInteractorDelegate: AnyObject {
    func handleOutput(_ output: HomeInteractorOutput)
}

// MARK: - Presenter
protocol HomePresenterProtocol {
    func load()
    func selectDayAt(indexPath: IndexPath)
}

enum HomePresenterOutput {
    case setLoading(Bool)
    case showInfo(WeatherInfoModel)
    case showList(WeatherListModel)
}

// MARK: - View
protocol HomeViewProtocol {
    func handleOutput(_ output: HomePresenterOutput)
}

// MARK: - Router
enum HomeRoute {
    // TODO: - Buraya detail model'i eklenecek
    case detail
    case search
}

protocol HomeRouterProtocol {
    func navigate(to route: HomeRoute)
}

