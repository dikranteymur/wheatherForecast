//
//  AppRouter.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 8.11.2023.
//

import UIKit

final class AppRouter {
    var window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        let viewController = HomeBuilder.make()
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
