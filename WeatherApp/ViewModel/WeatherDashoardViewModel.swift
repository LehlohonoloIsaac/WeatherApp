//
//  WeatherDashoardViewModel.swift
//  WeatherApp
//
//  Created by Lehlohonolo Mbele on 2020/08/04.
//  Copyright © 2020 Lehlohonolo Mbele. All rights reserved.
//

import UIKit

struct WeatherDashoardViewModel {
    let mainWeather: MainWeather
    var cityName: String? {
        return mainWeather.city.name
    }
    var country: String? {
        return mainWeather.city.country
    }
    
    var weatherList: [Weather] {
        let list = mainWeather.weatherList
        return list.sorted { (weather1, weather2) -> Bool in
            return weather1.date < weather2.date
        }
    }
    
    var todayWeather: Weather? {
        return mainWeather.weatherList.first
    }
    
    var weatherDescription: String? {
        return todayWeather?.weatherDetailsList.first?.main
    }
    var temperatureDescription: String? {
        return "\(String(describing: todayWeather?.temperature.toDegree ?? 0)) °C"
    }
    var weatherImageName: String? {
        switch weatherDescription {
        case "Clear":
            return "sun"
        case "Rain":
            return "rain"
        default:
            return ""
        }
    }
    
    init(mainWeather: MainWeather) {
        self.mainWeather = mainWeather
    }
    
}
