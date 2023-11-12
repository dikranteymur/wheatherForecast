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
        interactor.load(cityName: "Diyarbakir")
    }
    
    func selectDayAt(indexPath: IndexPath) {
        interactor.selectDayAt(indexPath: indexPath)
    }
}

// MARK: - HomeInteractorDelegate
extension HomePresenter: HomeInteractorDelegate {
    
    func handleOutput(_ output: HomeInteractorOutput) {
        switch output {
        case .setLoading(let bool):
            print(bool)
        case .showInfo(let weatherInfoModel):
            print(weatherInfoModel)
            view.handleOutput(.showInfo(weatherInfoModel))
        case .showList(let weatherListModel):
            print(weatherListModel)
            view.handleOutput(.showList(weatherListModel))
        case .showListDetail(let weatherInfoModel):
            print(weatherInfoModel)
            router.navigate(to: .detail)
        case .showSearchScene:
            print("Showing search scene")
            router.navigate(to: .detail)
        }
    }
    
    
}
