//
//  Kingfisher+Extension.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 12.11.2023.
//

import Foundation
import Kingfisher

extension KingfisherWrapper where Base: UIImageView {
    
    func getImage(with iconCode: String ) {
        if let url = URL(string: "http://openweathermap.org/img/w/\(iconCode).png)") {
            setImage(with: url)
        }
    }
}
