//
//  UserCache.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 10.11.2023.
//

import Foundation

enum UserCacheKeys: String {
    case hasLocation
    case isCelcius
}

struct UserCacheHelpers {
    
    static func hasLocation() -> Bool? {
        return UserDefaults.standard.bool(forKey: UserCacheKeys.hasLocation.rawValue)
    }
    
    static func setHasLocation(value: Bool) {
        UserDefaults.standard.setValue(value, forKey: UserCacheKeys.hasLocation.rawValue)
    }
    
    static func isCelcius() -> Bool? {
        return UserDefaults.standard.bool(forKey: UserCacheKeys.isCelcius.rawValue)
    }
    
    static func setIsLocation(value: Bool) {
        UserDefaults.standard.setValue(value, forKey: UserCacheKeys.isCelcius.rawValue)
    }
}
