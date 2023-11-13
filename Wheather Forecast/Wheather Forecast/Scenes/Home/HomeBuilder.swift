//
//  HomeBuilder.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 9.11.2023.
//

import UIKit

final class HomeBuilder {
    
    static func make() -> HomeViewController {
        let view = HomeViewController()
        let router = HomeRouter(view: view)
        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }
}
