//
//  DecodableResponseRequest.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 11.11.2023.
//

protocol DecodableResponseRequest: RequestProtocol {
    associatedtype ResponseModel: Decodable
}
