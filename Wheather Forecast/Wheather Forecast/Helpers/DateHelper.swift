//
//  CustomDateHelper.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 10.11.2023.
//

import UIKit

final class DateHelper {
    
    enum DaySymbolLength: Int {
        case one = 5
        case mid = 1
        case full = 4
    }
    
    static var shared = DateHelper()
    
    let dateFormatter = DateFormatter()
    
    init() {
        dateFormatter.locale = getPreferredLocale()
        dateFormatter.dateFormat = "E"
    }
    
    func currentHour() -> Int? {
        return dateFormatter.calendar.component(.hour, from: Date.now)
    }
    
    func currentDay() -> Int? {
        return dateFormatter.calendar.component(.day, from: Date.now)
    }
    
    func currentDaySymbol(length: DaySymbolLength = .full) -> String? {
        dateFormatter.dateFormat = Array(repeating: "E", count: length.rawValue).joined()
        return dateFormatter.string(from: Date.now)
    }
    
    func getDaySymbolFromDateString(date: String?) -> String? {
        guard let date = date, let dateString = dateFormatter.date(from: date) else { return nil }
        return dateFormatter.string(from: dateString)
    }
    
    func getDayFrom(iso: String) -> Int? {
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let date = dateFormatter.date(from: iso) {
            return dateFormatter.calendar.component(.day, from: date)
        }
        return nil
    }
    
    private func getPreferredLocale() -> Locale {
        guard let preferredIdentifier = Locale.preferredLanguages.first else {
            return Locale.current
        }
        return Locale(identifier: preferredIdentifier)
    }
}
