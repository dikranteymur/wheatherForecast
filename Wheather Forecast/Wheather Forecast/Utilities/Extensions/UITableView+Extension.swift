//
//  UITableViewCell+Extension.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 9.11.2023.
//

import UIKit

extension UITableView {

    func register<T: UITableViewCell>(_ cellClass: T.Type) {
        register(T.self, forCellReuseIdentifier: String(describing: T.self))
    }
}
