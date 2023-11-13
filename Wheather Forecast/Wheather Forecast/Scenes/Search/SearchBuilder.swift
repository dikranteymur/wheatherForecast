//
//  SearchBuilder.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 12.11.2023.
//

import Foundation

final class SearchBuilder {
    
    static func make(delegate: SearchPresenterDelegate? = nil) -> SearchViewController {
        let view = SearchViewController()
        let router = SearchRouter(view: view)
        let interactor = SearchInteractor()
        let presenter = SearchPresenter(view: view, interactor: interactor, router: router)
        presenter.delegate = delegate
        view.presenter = presenter
        return view
    }
}
