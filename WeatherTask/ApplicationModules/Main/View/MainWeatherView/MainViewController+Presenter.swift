//
//  MainViewController+PresenterDelegate.swift
//  WeatherTask
//
//  Created by Mohamed Nawar on 2/22/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import Foundation
import UIKit
extension MainViewController: CitiesListPresenterOutput {
    
    // after select a city from suggestion table view hide suggestion table view and show my saved cities
    func mainViewEditAfterSuggestionRequest() {
        showSavedCitiesTable()
    }
    // show and hide suggestion table view based on response of suggestion cities based on search on search bar
    func upadteSuggestedCitiesView(citiesCount: Int) {
        if citiesCount > 0 {
            showSuggestionTable()
            suggestionTableView.reloadData()
        }else{
            showSavedCitiesTable()
        }
    }
    // write selected city from suggestion table view to search bar
    func putSelectedCityInSearchBar(city: String) {
        searchBar.text = city
        showSavedCitiesTable()
    }
    // navigate to forecast city temperature
    func goToShowforecastCityTemperature(cityName: String, model: CityListModelInput) {
        let storybord = UIStoryboard(name: "Forecast", bundle: nil)
        let forecastWeatherListVC = storybord.instantiateViewController(withIdentifier: "ForecastViewController") as! ForecastViewController
        forecastWeatherListVC.cityName = cityName
        let presenter = ForecastWeatherPresenter(view: forecastWeatherListVC, model: model)
        forecastWeatherListVC.inject(forecastPresenter: presenter)
        self.navigationController?.pushViewController(forecastWeatherListVC, animated: true)
    }
    // reload my saved cities data view
    func upadteCities() {
        citiesTableView.reloadData()
    }
}
