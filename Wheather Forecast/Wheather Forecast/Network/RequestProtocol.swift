//
//  Request.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 8.11.2023.
//

import Foundation

protocol RequestProtocol {
    associatedtype ResponseModel: Decodable
    
    var endPoint: String { get }
    var method: HttpMethod { get }
    var parameters: RequestParameters { get }
    var headers: RequestHeaders { get}
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

typealias RequestParameters = [String: Any]
typealias RequestHeaders = [String: String]
