//
//  RequestModel.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 8.11.2023.
//

import Alamofire

struct RequestModel {
    let method: HTTPMethod
    var parameters: Parameters
    let headers: RequestHeaders
    let encoding: ParameterEncoding
    var url: String = ""
    
    init(request: some RequestProtocol) {
        self.method = request.method.afMethod
        self.parameters = request.parameters
        self.parameters["apikey"] = "7b433d7b3f47e68281a12dee893e8f60"
        self.headers = request.headers
        self.encoding = request.encoding.afEncoding
        self.url = request.url
    }
}

// MARK: - HTTPMethod
extension HttpMethod {
    var afMethod: HTTPMethod {
        switch self {
        case .get:
            return .get
        case .post:
            return .post
        }
    }
}

// MARK: - ParameterEncoding
extension EncodingType {
    var afEncoding: ParameterEncoding {
        switch self {
        case .url: 
            return URLEncoding.default
        case .json: 
            return JSONEncoding.default
        }
    }
}

//// MARK: - BaseUrl
//extension RequestModel {
//    var baseUrl: String {
//        return "https://api.openweathermap.org/"
//    }
//}
