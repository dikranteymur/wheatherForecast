//
//  HomeRouter.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 9.11.2023.
//

import UIKit

final class HomeRouter: HomeRouterProtocol {
    
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: HomeRoute) {
        switch route {
        case .detail(let weatherInfoModel):
            let detailViewcontroller = DetailBuilder.make(model: weatherInfoModel)
            view.present(detailViewcontroller, animated: true)
        case .search(let delegate):
            let searchViewController = SearchBuilder.make(delegate: delegate)
            searchViewController.modalPresentationStyle = .overCurrentContext
            view.present(searchViewController, animated: true)
        }
    }
}
