//
//  API.swift
//  MobileTakeHome
//
//  Created by André Alves on 09/09/22.
//

import Foundation

public typealias WeatherCompletion = (Result<Weather?, RequestError>) -> Void

public enum RequestError: Error {
    case parse
    case emptyData
    case request(error: String)
    case wrongURL
    
    var localizedDescription: String {
        switch self {
        case .parse:
            return "Error on parse data."
        case .emptyData:
            return "Received an empty data from request. Try again later."
        case .request(let error):
            return error
        case .wrongURL:
            return "URL seems wrong. Verify the URL string and try again later."
        }
    }
}

public protocol APIProtocol: AnyObject {
    func fetchWeather(with locationCode: Int, and completion: @escaping WeatherCompletion)
}

public class API: APIProtocol {
    static var shared: APIProtocol = API()
    
    public func fetchWeather(with locationCode: Int, and completion: @escaping WeatherCompletion) {
        let urlString = "https://cdn.faire.com/static/mobile-take-home/\(locationCode).json"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.wrongURL))
            return
        }
        
        var urlRequest = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10000)
        urlRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.request(error: error.localizedDescription)))
                    return
                }
                
                guard let dataResponse = data else {
                    completion(.failure(.emptyData))
                    return
                }
                
                if let weather = try? JSONDecoder.weatherDecoder().decode(Weather.self, from: dataResponse) {
                    completion(.success(weather))
                } else {
                    completion(.failure(.parse))
                }
            }
        }
        task.resume()
    }
}
