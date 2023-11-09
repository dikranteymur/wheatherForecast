//
//  Request.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 9.11.2023.
//

import Foundation

struct Request<T: Decodable>: RequestProtocol {
    typealias ResponseModel = T
    
    var endPoint: String
    var method: HttpMethod = .get
    var parameters: RequestParameters
    var headers: RequestHeaders
    var encoding: EncodingType
    var url: String
    
    init(endPoint: String,
         method: HttpMethod,
         parameters: RequestParameters,
         headers: RequestHeaders,
         encoding: EncodingType,
         url: String) {
        self.endPoint = endPoint
        self.method = method
        self.parameters = parameters
        self.headers = headers
        self.encoding = encoding
        self.url = url
    }
}
