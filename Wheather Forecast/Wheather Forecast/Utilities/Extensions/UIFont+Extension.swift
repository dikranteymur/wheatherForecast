//
//  CustomFont.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 9.11.2023.
//

import UIKit

enum CustomFontType: String {
    case thin = "Exo2-Thin"
    case light = "Exo2-Light"
    case regular = "Exo2-Regular"
    case semiBold = "Exo2-SemiBold"
}

extension UIFont {
    static func customFont(type: CustomFontType, size: CGFloat) -> UIFont? {
        return UIFont(name: type.rawValue, size: size)
    }
}
