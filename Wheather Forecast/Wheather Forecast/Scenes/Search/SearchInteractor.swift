//
//  SearchInteractor.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 12.11.2023.
//

import Foundation

final class SearchInteractor: SearchInteractorProtocol {
    
    weak var delegate: SearchInteractorDelegate?
    private var weatherInfo: WeatherInfoModel?
    
    func search(with cityName: String) {
        let request = SearchRequest(city: cityName)
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
    }
}
