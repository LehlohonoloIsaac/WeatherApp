//
//  TemoeratureDetailsViewController.swift
//  WeatherApp
//
//  Created by Lehlohonolo Mbele on 2020/08/04.
//  Copyright © 2020 Lehlohonolo Mbele. All rights reserved.
//

import UIKit

class TemperatureDetailsViewController: UIViewController {
    
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    var cityName: String
    var weather: Weather
    
    init(cityName: String,weather: Weather) {
        self.weather = weather
        self.cityName = cityName
        super.init(nibName: String(describing: TemperatureDetailsViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityNameLabel.text = cityName
        dayOfWeekLabel.text = weather.dayOfWeek
        temperatureLabel.text = "\(String(describing: weather.temperature.toDegree)) °C"
    }
    
}
