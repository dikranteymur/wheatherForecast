//
//  SearchProtocols.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 12.11.2023.
//

// MARK: - Interactor
protocol SearchInteractorProtocol {
    var delegate: SearchInteractorDelegate? { get set }
    func search(with cityName: String)
}

enum SearchInteractorOutput {
    case showInfo(WeatherInfoModel)
}

protocol SearchInteractorDelegate: AnyObject {
    func handleOutput(_ output: SearchInteractorOutput)
}

// MARK: - Presenter
protocol SearchPresenterDelegate: AnyObject {
    func handleHomeView(with model: WeatherInfoModel)
}

protocol SearchPresenterProtocol {
    func search(with cityName: String)
    func loadHomeView(with model: WeatherInfoModel)
}

enum SearchPresenterOutput {
    case showInfo(WeatherInfoModel)
}

// MARK: - View
protocol SearchViewProtocol: AnyObject {
    func handleOutput(_ output: SearchPresenterOutput)
}

// MARK: - Router
enum SearchRoute {
    case dismiss
}

protocol SearchRouterProtocol {
    func navigate(to route: SearchRoute)
}

