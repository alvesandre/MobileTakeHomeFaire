//
//  WeatherMock.swift
//  MobileTakeHomeTests
//
//  Created by André Alves on 09/09/22.
//

import Foundation
@testable import MobileTakeHome

extension Weather {
    static func mock() -> Weather {
        return Weather.decodeMock(with: "mock")
    }
    
    static func mockWithoutWeather() -> Weather {
        return Weather.decodeMock(with: "mockWithoutWeather")
    }
    
    private static func decodeMock(with fileName: String) -> Weather {
        let url = Bundle.main.url(forResource: fileName, withExtension: "json")
        let data = try! Data(contentsOf: url!)
        
        return try! JSONDecoder.weatherDecoder().decode(Weather.self, from: data)
    }
    
}
