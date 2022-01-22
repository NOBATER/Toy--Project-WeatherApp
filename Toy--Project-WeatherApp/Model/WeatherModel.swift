//
//  WeatherModel.swift
//  Toy--Project-WeatherApp
//
//  Created by 정덕호 on 2022/01/16.
//

import Foundation

struct WeatherStruct{

    var day: Int = 0
    var min: Double = 0
    var max: Double = 0
    var id: Int = 0
    
var conditionName: String {
    switch id {
    case 200...232:
        return "cloud.bolt"
    case 300...321:
        return "cloud.drizzle"
    case 500...531:
        return "cloud.rain"
    case 600...622:
        return "cloud.snow"
    case 701...781:
        return "cloud.fog"
    case 800:
        return "sun.max"
    case 801...804:
        return "cloud.bolt"
    default:
        return "cloud"
    }
}

    
    
    
    var dayName: String {
        switch day {
        case 1: return "일요일"
        case 2: return "월요일"
        case 3: return "화요일"
        case 4: return "수요일"
        case 5: return "목요일"
        case 6: return "금요일"
        case 7: return "토요일"
        default: return ""
        }
    }

    
    
    
}


