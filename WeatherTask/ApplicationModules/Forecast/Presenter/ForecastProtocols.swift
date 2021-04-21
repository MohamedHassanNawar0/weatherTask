//
//  ForecastProtocols.swift
//  WeatherTask
//
//  Created by Mohamed Nawar on 2/22/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import Foundation

protocol ForecastWeatherView: class {
    func showIndicator()
    func showMessage(message:String)
    func hideIndicator()
    func fetchingDataSuccess()
}
protocol SaveCityData {
    func saveCityData()
}
protocol ForecastWeatherCell {
    func displayDate(date: String)
    func displayTempreture(tempreture: Int)
    func displayImage(imageNameBasedOnCondition: String)
}
