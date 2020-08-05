//
//  Weather.swift
//  WeatherApp
//
//  Created by Lehlohonolo Mbele on 2020/08/04.
//  Copyright © 2020 Lehlohonolo Mbele. All rights reserved.
//

import UIKit

struct Weather {
    let temperature: Temperature
    let date: Double
    let weatherDetailsList: [WeatherDetails]
    
    var dayOfWeek: String {
        let currentDate = Date(timeIntervalSince1970: date)
        let weekDay = Calendar.current.dateComponents([.weekday], from: currentDate).weekday ?? 0
        switch weekDay {
        case 1: return "SUN"
        case 2: return "MON"
        case 3: return "TUE"
        case 4: return "WED"
        case 5: return "THUR"
        case 6: return "FRI"
        case 7: return "SAT"
        default: return ""
        }
    }
}

extension Weather: Decodable {
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case date = "dt"
        case weatherDetailsList = "weather"
    }
}
