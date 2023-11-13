//
//  SearchRequest.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 12.11.2023.
//

import Foundation

struct SearchRequest: ApiRequest {
    typealias ResponseModel = WeatherInfoModel
    
    var endPoint: String = "data/2.5/weather"
    var method: HttpMethod = .get
    var parameters: RequestParameters = [:]
    var headers: RequestHeaders = [:]
    
    init(city: String) {
        parameters.setApiKey()
        parameters["q"] = city
        parameters["lang"] = LocationHelper.shared.currentLocaleIdentifier()
        parameters["units"] = ApiUnits.metric.rawValue
    }
}
