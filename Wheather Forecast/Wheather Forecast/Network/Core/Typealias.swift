//
//  Typealias.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 11.11.2023.
//

typealias RequestParameters = [String: Any]
typealias RequestHeaders = [String: String]

extension RequestParameters {
    
    mutating func setApiKey() {
        self["apikey"] = "7b433d7b3f47e68281a12dee893e8f60"
    }
}
