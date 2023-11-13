//
//  SearchRouter.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 12.11.2023.
//

import UIKit

final class SearchRouter: SearchRouterProtocol {
   
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: SearchRoute) {
        switch route {
        case .dismiss:
            view.dismiss(animated: true)
        }
    }
}
