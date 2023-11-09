//
//  NetworkError.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 8.11.2023.
//

import Foundation

enum NetworkError: Error {
    case connectionError
    case serverError
    case baseError(Error)
}
