//
//  ForecastWeather+TableView.swift
//  WeatherTask
//
//  Created by Mohamed Nawar on 2/20/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import UIKit

extension ForecastViewController: UITableViewDataSource, UITableViewDelegate {
    //MARK: - setup tableViewDataSource and tableViewDelegate
    func setupTableView() {
        forecastTableView.dataSource = self
        forecastTableView.delegate = self
        forecastTableView.backgroundColor = .clear
        setupTableViewCells()
    }
    
    func setupTableViewCells() {
        forecastTableView?.register(CurrentWeatherForecastCell.self)
        forecastTableView?.register(FutureWeatherForecastCell.self)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastPresenter.getForecastWeather()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let currentCell = tableView.dequeueReusableCell(CurrentWeatherForecastCell.self, for: indexPath)
            forecastPresenter.configure(cell: currentCell, for: indexPath.row)

            return currentCell
        }else{
        let futureCell = tableView.dequeueReusableCell(FutureWeatherForecastCell.self, for: indexPath) 
            forecastPresenter.configure(cell: futureCell, for: indexPath.row)

        return futureCell
        }
    }
}
