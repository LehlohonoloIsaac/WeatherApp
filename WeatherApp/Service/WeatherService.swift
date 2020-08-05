//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Lehlohonolo Mbele on 2020/08/04.
//  Copyright © 2020 Lehlohonolo Mbele. All rights reserved.
//

import UIKit

class WeatherService {
    private let apiKey = "2233e28cc7694b4493e11779196d110a"
    
    func fetchWeatherData(completion: @escaping (MainWeather?) -> Void) {
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let url = URL(string: "https://samples.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=7&appid=2233e28cc7694b4493e11779196d110a")!
        let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            print("###############     Response     #############\n")
            guard let data = data else {
                completion(nil)
                return
            }
            let mainWeather = try? JSONDecoder().decode(MainWeather.self, from: data)
            completion(mainWeather)
        })
        task.resume()
    }
    
}
