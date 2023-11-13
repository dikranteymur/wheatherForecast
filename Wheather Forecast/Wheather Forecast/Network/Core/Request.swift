//
//  Request.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 11.11.2023.
//

protocol ApiRequest: DecodableResponseRequest {}

// MARK: - Encoding
extension ApiRequest {
    var encoding: EncodingType {
        switch method {
        case .get:
            return .url
        default:
            return .json
        }
    }
}

// MARK: - Url
extension ApiRequest {
    var url: String {
        return "https://api.openweathermap.org/" + endPoint
    }
}

// MARK: - Parameters
extension ApiRequest {
    var parameters: RequestParameters {
        return [:]
    }
}

// MARK: - Headers
extension ApiRequest {
    var headers: RequestHeaders {
        return [:]
    }
}
