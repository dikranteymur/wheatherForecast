//
//  HomeRequest.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 11.11.2023.
//

import Foundation

struct HomeWeatherRequest: ApiRequest {
    typealias ResponseModel = WeatherInfoModel
    
    var endPoint: String = "data/2.5/weather"
    var method: HttpMethod = .get
    var parameters: RequestParameters = [:]
    var headers: RequestHeaders = [:]
    
    init(city: String) {
        parameters.setApiKey()
        parameters["q"] = city
        parameters["lang"] = LocationHelper.shared.currentLocaleIdentifier()
        parameters["metric"] = ApiUnits.metric.rawValue
    }
    
    init(lat: Double?, lon: Double?) {
        parameters.setApiKey()
        parameters["lat"] = lat
        parameters["lon"] = lon
        parameters["lang"] = LocationHelper.shared.currentLocaleIdentifier()
        parameters["metric"] = ApiUnits.metric.rawValue
    }
}

struct HomeHourlyWeatherListRequest: ApiRequest {
    typealias ResponseModel = WeatherListModel
    
    var endPoint: String = "data/2.5/forecast"
    var method: HttpMethod = .get
    var parameters: RequestParameters = [:]
    var headers: RequestHeaders = [:]
    
    init(city: String) {
        parameters.setApiKey()
        parameters["q"] = city
    }
    
    init(lat: Double?, lon: Double?) {
        parameters.setApiKey()
        parameters["lat"] = lat
        parameters["lon"] = lon
    }
}
