//
//  ForecastWeather+PresenterDelegate.swift
//  WeatherTask
//
//  Created by Mohamed Nawar on 2/21/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import Foundation
import PKHUD

extension ForecastViewController: ForecastWeatherView {
    // method to show message to user when adding a city to saved cities
    func showMessage(message: String) {
        HUD.flash(.label(message), delay: 2.0)
    }
    // show progress indicator when fetching forecast weather request
    func showIndicator() {
        self.activityIndicator(isStart: true)
    }
    // hide progress indicator after fetching forecast weather request
    func hideIndicator() {
        self.activityIndicator(isStart: false)
    }
    // refresh forecast view after fetching forecast weather request
    func fetchingDataSuccess() {
        forecastTableView.reloadData()
    }
}
