//
//  HomeInteractor.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 9.11.2023.
//

import Foundation

final class HomeInteractor: HomeInteractorProtocol {
    
    weak var delegate: HomeInteractorDelegate?
    private var weatherInfo: WeatherInfoModel?
    private var weatherList: WeatherListModel?
    
    func load() {
        if UserCacheHelpers.hasLocation() {
            let request = HomeWeatherRequest(lat: LocationHelper.shared.getCoordinate().lat,
                                             lon: LocationHelper.shared.getCoordinate().lon)
            app.service.request(request: request) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    self.weatherInfo = response
                    delegate?.handleOutput(.showInfo(response))
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
            let request2 = HomeHourlyWeatherListRequest(lat: LocationHelper.shared.getCoordinate().lat,
                                              lon: LocationHelper.shared.getCoordinate().lon)
            app.service.request(request: request2) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    self.weatherList = response
                    delegate?.handleOutput(.showList(response))
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        } 
    }
    
    func loadWeatherList(city: String) {
        let request = HomeHourlyWeatherListRequest(city: city)
        app.service.request(request: request) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.delegate?.handleOutput(.showList(response))
                self.weatherList = response
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func selectDayAt(indexPath: IndexPath) {
        if let list = weatherList?.list {
            let model = list[indexPath.row]
            delegate?.handleOutput(.showListDetail(model))
        }
    }
}

// MARK: - Configure
extension HomeInteractor {
    
    private func configureSavedCities(model: WeatherInfoModel) {
        var savedCities = UserCacheHelpers.getSavedCityNames()
        if let cityName = model.name, !savedCities.contains(cityName) {
            savedCities.append(cityName)
            UserCacheHelpers.saveCityNames(savedCities)
        }
    }
}
