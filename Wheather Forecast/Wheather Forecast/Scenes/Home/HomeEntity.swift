//
//  HomeEntity.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 9.11.2023.
//

import Foundation

struct WeatherListModel: Decodable {
    let list: [WeatherInfoModel]?
    let date: String?
    
    private enum CodingKeys: String, CodingKey {
        case list
        case date = "dt_txt"
    }
}

struct WeatherInfoModel: Decodable {
    let weather: [WeatherModel]?
    let main: MainModel?
    let wind: WindModel?
    let sys: SysModel?
    let name: String?
    let country: String?
    let date: String?
    
    private enum CodingKeys: String, CodingKey {
        case weather, main, wind, sys, name, country
        case date = "dt_txt"
    }
}

struct WeatherModel: Decodable {
    let main: String?
    let description: String?
    let icon: String?
}

struct MainModel: Decodable {
    let temp: Double?
    let tempMin: Double?
    let tempMax: Double?
    let humidity: Int?
    
    private enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity
    }
}

struct WindModel: Decodable {
    let speed: Double?
}

struct SysModel: Decodable {
    let country: String?
}
