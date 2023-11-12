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
    private var weatherList: [WeatherInfoModel] = []
    
    func load(cityName: String) {
        delegate?.handleOutput(.setLoading(true))
        if UserCacheHelpers.hasLocation() {
            let request = HomeWeatherRequest(lat: LocationHelper.shared.getCoordinate().lat,
                                             lon: LocationHelper.shared.getCoordinate().lon)
            print(LocationHelper.shared.getCoordinate().lat)
            print(LocationHelper.shared.getCoordinate().lon)
            
            app.service.request(request: request) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    delegate?.handleOutput(.setLoading(false))
                    print("Response: \(response)")
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
                    delegate?.handleOutput(.showList(response))
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        } else {
            if UserCacheHelpers.getSavedCityNames().isEmpty {
                // TODO: - Open search screen
                delegate?.handleOutput(.showSearchScene)
            } else {
                let request = HomeWeatherRequest(city: cityName)
                app.service.request(request: request) { [weak self] result in
                    guard let self = self else { return }
                    switch result {
                    case .success(let response):
                        print(response)
                        configureSavedCities(model: response)
                        self.weatherInfo = response
                        delegate?.handleOutput(.showInfo(response))
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    func selectDayAt(indexPath: IndexPath) {
        let model = weatherList[indexPath.row]
        delegate?.handleOutput(.showListDetail(model))
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
