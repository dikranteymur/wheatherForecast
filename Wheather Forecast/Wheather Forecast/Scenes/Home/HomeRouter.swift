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
        case .detail:
            print("Detay Sayfasi Acilacak")
        case .search:
            print("Search Sayfasi Acilacak")
        }
    }
}
