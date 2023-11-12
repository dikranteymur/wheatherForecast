//
//  UserCache.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 10.11.2023.
//

import Foundation

struct UserCacheHelpers {
    
    static func hasLocation() -> Bool {
        return UserDefaults.standard.bool(forKey: UserCacheKeys.hasLocation.rawValue)
    }
    
    static func setHasLocation(value: Bool) {
        UserDefaults.standard.setValue(value, forKey: UserCacheKeys.hasLocation.rawValue)
    }
    
    static func isCelcius() -> Bool {
        return UserDefaults.standard.bool(forKey: UserCacheKeys.isCelcius.rawValue)
    }
    
    static func setIsCelcius(value: Bool) {
        UserDefaults.standard.setValue(value, forKey: UserCacheKeys.isCelcius.rawValue)
    }
    
    static func saveCityNames(_ value: [String]) {
        UserDefaults.standard.set(value, forKey: UserCacheKeys.savedCityNames.rawValue)
    }
    
    static func getSavedCityNames() -> [String] {
        if let savedCityNames = UserDefaults.standard.value(forKey: UserCacheKeys.savedCityNames.rawValue) as? [String] {
            return savedCityNames
        }
        return []
    }
}

// MARK: - UserCacheKeys
extension UserCacheHelpers {
    enum UserCacheKeys: String {
        case hasLocation
        case isCelcius
        case savedCityNames
    }
}
