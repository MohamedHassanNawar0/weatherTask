//
//  MainForecastProtocols.swift
//  WeatherTask
//
//  Created by Mohamed Nawar on 2/22/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import Foundation


protocol MainCitiesView: class {
    var numberOfCities: Int { get }
    func loadCities()
    func didSelectCityRow(index: Int)
    func didSelectSuggestedCityRow(index: Int)
    func didPressSearch(name: String)
    func removeCity(index: Int)
}

protocol CitiesListPresenterOutput: AnyObject {
    func upadteCities()
    func upadteSuggestedCitiesView(citiesCount:Int)
    func goToShowforecastCityTemperature(cityName: String , model:CityListModelInput)
    func putSelectedCityInSearchBar(city:String)
    func mainViewEditAfterSuggestionRequest()
}

protocol MainCitiesCellView {
    func displayCity(cityName: String)
    func displayDate(date:Date)
}
protocol SuggestedCitiesCellView {
    func displaySuggestedCity(cityName: String)
}
