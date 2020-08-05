//
//  ViewController.swift
//  WeatherApp
//
//  Created by Lehlohonolo Mbele on 2020/08/04.
//  Copyright © 2020 Lehlohonolo Mbele. All rights reserved.
//

import UIKit

class WeatherDashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let weatherService = WeatherService()
    private var viewModel: WeatherDashoardViewModel?
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        retrieveWeatherData()
    }
    
    private func retrieveWeatherData() {
        weatherService.fetchWeatherData { [weak self] mainWeather in
            guard let mainWeather = mainWeather else {
                return
            }
            self?.viewModel = WeatherDashoardViewModel(mainWeather: mainWeather)
            self?.weatherImageView.image = UIImage(named: self?.viewModel?.weatherImageName ?? "", in: nil, compatibleWith: nil)
            self?.weatherDescriptionLabel.text = self?.viewModel?.weatherDescription
            self?.temperatureLabel.text = self?.viewModel?.temperatureDescription
            self?.countryLabel.text = self?.viewModel?.cityName
            self?.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.viewModel?.weatherList.count ?? 0) - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TemperatureTableViewCell else { return UITableViewCell() }
        let weather = viewModel?.weatherList[indexPath.row + 1]
        cell.dayOfWeek.text = String(describing: weather?.dayOfWeek ?? "")
        cell.temperatureLabel.text = "\(String(describing: weather?.temperature.toDegree ?? 0)) °C"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let weather = viewModel?.weatherList[indexPath.row + 1] else { return }
        let temperatureDetailsViewController = TemperatureDetailsViewController(cityName: self.viewModel?.cityName ?? "", weather: weather)
        present(temperatureDetailsViewController, animated: true, completion: nil)
    }
    
}

