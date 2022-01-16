//
//  Weather.swift
//  Toy--Project-WeatherApp
//
//  Created by 민선기 on 2022/01/16.
//

import Foundation

// MARK: - Forecast
struct Forecast: Codable {
    var current: Current
    var daily: [Daily]
}

struct Current: Codable {
    
}

struct Daily: Codable {
    var dt: TimeInterval
    var sunset: Date
    var temp: Temp
    var weather: [Weather]
    
    /// Date를 요일별 Int로 변환하는 함수
    /// - Returns:
    ///     1 = 일요일, 2 = 월요일, 3 = 화요일....
    func weekday() -> Int {
        let calendar = Calendar.current
        let component = calendar.component(.weekday, from: Date(timeIntervalSince1970: dt))
        return component
    }
}

struct Temp: Codable {
    var min: Double
    var max: Double
}

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

// MARK: - Search
struct Search: Codable {
    var weather: [Weather]
    var name: String
    var main: CityTemp
}

struct CityTemp: Codable {
    var temp: Double
    var tempMin: Double
    var tempMax: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
