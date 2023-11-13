//
//  UIImageView+Extension.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 12.11.2023.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func getImage(with iconCode: String) {
        if let url = URL(string: "http://openweathermap.org/img/w/\(iconCode).png") {
            self.sd_setImage(with: url)
        }
    }
}
