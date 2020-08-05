//
//  City.swift
//  WeatherApp
//
//  Created by Lehlohonolo Mbele on 2020/08/04.
//  Copyright © 2020 Lehlohonolo Mbele. All rights reserved.
//

import UIKit

struct City {
    let name: String
    let country: String
}

extension City: Decodable {
    enum CodingKeys: String, CodingKey {
        case name, country
    }
}
