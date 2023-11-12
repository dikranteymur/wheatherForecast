//
//  NotificationCenter+Extension.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 11.11.2023.
//

import Foundation

extension NotificationCenter {
    
    static func addNotification(_ observer: Any, name: Notification.Name, selector: Selector, object: Any? = nil) {
        self.default.addObserver(observer, selector: selector, name: name, object: object)
    }
    
    static func postNotificaiton(_ name: Notification.Name, object: Any? = nil, userInfo: [AnyHashable: Any]? = nil) {
        self.default.post(name: name, object: object, userInfo: userInfo)
    }
}
