//
//  Weather.swift
//  MobileTakeHome
//
//  Created by André Alves on 09/09/22.
//

import Foundation

public struct Weather: Decodable {
    var locationName: String?
    var weatherDays: [WeatherDay]?
    
    enum CodingKeys: String, CodingKey {
        case locationName = "title"
        case weatherDays = "consolidated_weather"
    }
}

public struct WeatherDay: Decodable {
    var name: String?
    var imgName: String?
    var applicableDate: Date?
    var minTemp: Double?
    var maxTemp: Double?
    var currTemp: Double?
    
    enum CodingKeys: String, CodingKey {
        case name = "weather_state_name"
        case imgName = "weather_state_abbr"
        case applicableDate = "applicable_date"
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case currTemp = "the_temp"
    }
}
