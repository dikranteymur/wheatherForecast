//
//  SearchPresenter.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 12.11.2023.
//

import Foundation

final class SearchPresenter: SearchPresenterProtocol {
    
    weak var delegate: SearchPresenterDelegate?
    private unowned let view: SearchViewProtocol
    private var interactor: SearchInteractorProtocol
    private let router: SearchRouterProtocol
    
    init(view: SearchViewProtocol, interactor: SearchInteractorProtocol, router: SearchRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router

        self.interactor.delegate = self
    }
    
    func search(with cityName: String) {
        interactor.search(with: cityName)
    }
    
    func loadHomeView(with model: WeatherInfoModel) {
        delegate?.handleHomeView(with: model)
    }
}

// MARK: - SearchInteractorDelegate
extension SearchPresenter: SearchInteractorDelegate {
    
    func handleOutput(_ output: SearchInteractorOutput) {
        switch output {
        case .showInfo(let weatherInfoModel):
            view.handleOutput(.showInfo(weatherInfoModel))
            router.navigate(to: .dismiss)
        }
    }
}
