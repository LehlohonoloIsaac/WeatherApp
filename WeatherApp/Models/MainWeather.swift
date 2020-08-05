//
//  MainWeather.swift
//  WeatherApp
//
//  Created by Lehlohonolo Mbele on 2020/08/04.
//  Copyright © 2020 Lehlohonolo Mbele. All rights reserved.
//

import UIKit

struct MainWeather {
    let city: City
    let weatherList: [Weather]
}

extension MainWeather: Decodable {
    enum CodingKeys: String, CodingKey {
        case city = "city"
        case weatherList = "list"
    }
}
