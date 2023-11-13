//
//  AppDelegate+CoreLocation.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 10.11.2023.
//

import Foundation

extension AppDelegate {
    
    func configureCoreLocation() {
        LocationHelper.shared.requestLocation()
    }
}
