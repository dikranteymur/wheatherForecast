//
//  DetailPresenter.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 11.11.2023.
//

import Foundation

final class DetailPresenter: DetailPresenterProtocol {
    
    private unowned let view: DetailViewProtocol
    var weatherInfoModel: WeatherInfoModel?
    
    init(view: DetailViewProtocol, weatherInfoModel: WeatherInfoModel?) {
        self.view = view
        self.weatherInfoModel = weatherInfoModel
    }
    
    func load() {
        guard let weatherInfoModel = weatherInfoModel else { return }
        view.handleOutput(.showInfo(weatherInfoModel))
    }
}
