//
//  ForecastCell.swift
//  Weather
//
//  Created by Savca Marin on 7/2/19.
//  Copyright © 2019 Savca Marin. All rights reserved.
//

import UIKit

class ForecastCell: UITableViewCell {
   
   @IBOutlet weak private var locationLabel: UILabel!
   @IBOutlet weak private var temperatureLabel: UILabel!
   @IBOutlet weak private var humidityLabel: UILabel!
   @IBOutlet weak private var windSpeedLabel: UILabel!
   @IBOutlet weak private var descriptionLabel: UILabel!
   
   func setupCell(_ forecast: Forecast) {
      DispatchQueue.main.async {
         self.locationLabel.text = "\(forecast.name), \(forecast.sys.country)"
         self.temperatureLabel.text = "\(forecast.main.temp)°C"
         self.humidityLabel.text = "\(forecast.main.humidity)%"
         self.windSpeedLabel.text = "\(forecast.wind.speed)km/h"
         self.descriptionLabel.text = "\(forecast.weather.first?.weatherDescription ?? "")"
      }
   }
   
}
