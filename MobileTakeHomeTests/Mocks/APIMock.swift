//
//  APIMock.swift
//  MobileTakeHomeTests
//
//  Created by André Alves on 09/09/22.
//

import Foundation
@testable import MobileTakeHome

public class APIMockSuccess: APIProtocol {
    public func fetchWeather(with locationCode: Int, and completion: @escaping WeatherCompletion) {
        completion(.success(Weather.mock()))
    }
}

public class APIMockNoWeather: APIProtocol {
    public func fetchWeather(with locationCode: Int, and completion: @escaping WeatherCompletion) {
        completion(.success(Weather.mockWithoutWeather()))
    }
}

public class APIMockErrorEmptyData: APIProtocol {
    public func fetchWeather(with locationCode: Int, and completion: @escaping WeatherCompletion) {
        completion(.failure(.emptyData))
    }
}

public class APIMockErrorParse: APIProtocol {
    public func fetchWeather(with locationCode: Int, and completion: @escaping WeatherCompletion) {
        completion(.failure(.parse))
    }
}

public class APIMockErrorRequest: APIProtocol {
    public func fetchWeather(with locationCode: Int, and completion: @escaping WeatherCompletion) {
        completion(.failure(.request(error: "custom error")))
    }
}

public class APIMockErrorWrongURL: APIProtocol {
    public func fetchWeather(with locationCode: Int, and completion: @escaping WeatherCompletion) {
        completion(.failure(.wrongURL))
    }
}
