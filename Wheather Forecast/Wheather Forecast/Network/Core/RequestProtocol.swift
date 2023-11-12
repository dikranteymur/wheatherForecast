//
//  Request.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 8.11.2023.
//

import Foundation

protocol RequestProtocol {
//    associatedtype ResponseModel: Decodable
    
    var endPoint: String { get }
    var method: HttpMethod { get }
    var parameters: RequestParameters { get set }
    var headers: RequestHeaders { get set }
    var encoding: EncodingType { get }
    var url: String { get }
}

enum EncodingType {
    case url
    case json
}

enum HttpMethod: String {
    case get
    case post
}

enum ApiUnits: String {
    case standart
    case metric
    case imperial
}
