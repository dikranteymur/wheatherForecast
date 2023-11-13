//
//  HomePresenter.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 9.11.2023.
//

import Foundation

final class HomePresenter: HomePresenterProtocol {
    
    private let view: HomeViewProtocol
    private var interactor: HomeInteractorProtocol
    private let router: HomeRouterProtocol
    
    init(view: HomeViewProtocol, interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router

        self.interactor.delegate = self
    }
    
    func load() {
        interactor.load()
    }
    
    func loadWeatherInfoList(with city: String) {
        interactor.loadWeatherList(city: city)
    }
    
    func selectDayAt(indexPath: IndexPath) {
        interactor.selectDayAt(indexPath: indexPath)
    }
    
    func loadWithCurrent(model: WeatherInfoModel) {
        view.handleOutput(.showInfo(model))
    }
    
    func openSearchView(delegate: SearchPresenterDelegate?) {
        router.navigate(to: .search(delegate: delegate))
    }
}

// MARK: - HomeInteractorDelegate
extension HomePresenter: HomeInteractorDelegate {
    
    func handleOutput(_ output: HomeInteractorOutput) {
        switch output {
        case .showInfo(let weatherInfoModel):
            view.handleOutput(.showInfo(weatherInfoModel))
        case .showList(let weatherListModel):
            view.handleOutput(.showList(weatherListModel))
        case .showListDetail(let weatherInfoModel):
            router.navigate(to: .detail(model: weatherInfoModel))
        }
    }
}
