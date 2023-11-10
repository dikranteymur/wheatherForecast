//
//  AppService.swift
//  Wheather Forecast
//
//  Created by Dikran Teymur on 8.11.2023.
//

import Foundation
import Alamofire

typealias ResponseData<T: Decodable> = (Result<T, NetworkError>) -> Void

protocol AppServiceProtocol {
    func request<T: RequestProtocol>(request: T, result: ResponseData<T.ResponseModel>?)
}

struct AppService: AppServiceProtocol {
    
    var session: Session
    
    init() {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 15
        configuration.requestCachePolicy = .reloadRevalidatingCacheData
        session = Session(configuration: configuration)
    }
    
    func request<T: RequestProtocol>(request: T, result: ResponseData<T.ResponseModel>?) {
        let isReachable = NetworkReachabilityManager()?.isReachable ?? false
        if !isReachable {
            result?(.failure(.connectionError))
        } else {
            let request = createRequest(request: request)
            request?.validate()
            request?.responseDecodable(of: T.ResponseModel.self) { (response) in
                switch response.result {
                case .success(let value):
                    result?(.success(value))
                case .failure(let error):
                    result?(.failure(.baseError(error)))
                }
            }
        }
    }
}

// MARK: - Create Request
extension AppService {
    
    private func createRequest(request: some RequestProtocol) -> DataRequest? {
        return session.request(request.url,
                               method: .get,
                               parameters: request.parameters,
                               encoding: URLEncoding.default,
                               headers: HTTPHeaders(request.headers),
                               interceptor: nil,
                               requestModifier: nil)
    }
}
