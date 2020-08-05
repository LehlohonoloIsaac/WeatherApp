//
//  Temperature.swift
//  WeatherApp
//
//  Created by Lehlohonolo Mbele on 2020/08/04.
//  Copyright © 2020 Lehlohonolo Mbele. All rights reserved.
//

import UIKit

struct Temperature {
    let dayTemperature: Double
    
    var toDegree: Int {
        return Int(Double(5)/Double(9) * (dayTemperature - 32))
    }
}

extension Temperature: Decodable {
    enum CodingKeys: String, CodingKey {
        case dayTemperature = "day"
    }
}
