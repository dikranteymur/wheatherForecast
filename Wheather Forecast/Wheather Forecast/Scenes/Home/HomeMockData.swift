//
//  HomeMock.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 9.11.2023.
//

import UIKit

class HomeMockData {
    
    static func getDatas() -> HomeData {
        return HomeData(cityName: "Diyarbakir", today: "Persembe, 20:00", image: UIImage(named: "cloudy")!, temperature: "22 ºC", info: "Parcali Bulutlu")
    }
}

struct HomeData {
    var cityName: String
    var today: String
    var image: UIImage
    var temperature: String
    var info: String
}
