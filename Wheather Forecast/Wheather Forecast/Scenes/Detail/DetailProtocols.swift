//
//  DetailProtocols.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 11.11.2023.
//

// MARK: - Presenter
protocol DetailPresenterProtocol {
    func load()
}

enum DetailPresenterOutput {
    case showInfo(WeatherInfoModel)
}

// MARK: - View
protocol DetailViewProtocol: AnyObject {
    func handleOutput(_ output: DetailPresenterOutput)
}
