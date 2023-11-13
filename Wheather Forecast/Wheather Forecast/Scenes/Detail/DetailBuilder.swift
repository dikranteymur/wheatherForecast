//
//  DetailBuilder.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 10.11.2023.
//

import UIKit

final class DetailBuilder {
    
    static func make(model: WeatherInfoModel) -> DetailViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, weatherInfoModel: model)
        view.presenter = presenter
        return view
    }
}
