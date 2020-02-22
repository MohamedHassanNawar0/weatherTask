//
//  MainPresenter.swift
//  WeatherTask
//
//  Created by Mohamed Nawar on 2/20/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import Foundation

class MainVCPresenter : MainCitiesView {
    
    private let interactor = MainInteractor()
    private var suggestedCities = ForecastDataModel()
    private weak var view: CitiesListPresenterOutput!
    private(set) var model: CityListModelInput
    private(set) var cities: [City] = []
    
    init(view: CitiesListPresenterOutput ,model: CityListModelInput ) {
        self.view = view
        self.model = model
    }
    // method called when press search to navigate to forecast weather view
    func didPressSearch(name: String) {
        view?.goToShowforecastCityTemperature(cityName: name, model: model)
    }
    // method to retuen count of suggested cities based on writing in search bar 
    func getCitiesCount() -> Int {
        return suggestedCities.list?.count ?? 0
    }
    // method called when writing in search bar to get suggested cities
    func SearchBarTextChanged(text: String){
        interactor.getSuggestedCities(cityName: text){ [weak self] (suggestedCities, error) in
            guard self != nil else { return }
            if error != nil {
                
                self?.view?.mainViewEditAfterSuggestionRequest()
            } else {
                guard let suggestedCities = suggestedCities else { return }
                self?.suggestedCities = suggestedCities
                let count = suggestedCities.list?.count ?? 0; self?.view?.upadteSuggestedCitiesView(citiesCount: count)
            }
        }
    }
    // get count of saved cities
    var numberOfCities: Int {
        cities.count
    }
    // method to return number of saved cities
    func loadCities() {
        model.fetchAllCities { [weak self] cities in
            self?.cities = cities ?? []
            self?.view.upadteCities()
        }
    }
    // method called to add new city to saved cities
    func didTapRegisterAction(name: String, tempreture: String) {
        model.registerCity(name: name, tempreture: tempreture, completion: {  message in
            print(message ?? "")
        })
        model.fetchAllCities { [weak self] cities in
            self?.cities = cities ?? []
            self?.view.upadteCities()
        }
    }
    // method to set my saved cities Table View Cell with data
    func configureCitiesTableViewCell(cell: MainCitiesCellView, for index: Int) {
        cell.displayDate(date: self.cities[index].dateAdded ?? Date())
        cell.displayCity(cityName:self.cities[index].cityname ?? "")
    }
    // method to set Suggestion Table View Cell with data
    func configureSuggestionTableViewCell(cell: SuggestedCitiesCellView, for index: Int) {
        let city = self.suggestedCities.list?[index].name ?? ""
        let country = self.suggestedCities.list?[index].sys?.country ?? ""
        cell.displaySuggestedCity(cityName:"\(city), \(country)")
    }
    // method called when select a city from my saved cities table view to navigate to forecast weather of selected city
    func didSelectCityRow(index: Int) {
        let city = cities[index].cityname ?? ""
        view?.goToShowforecastCityTemperature(cityName: city , model:model)
    }
    // method called when select a city from suggestion table view to put selected city in search bar
    func didSelectSuggestedCityRow(index: Int) {
        let city = self.suggestedCities.list?[index].name ?? ""
        let country = self.suggestedCities.list?[index].sys?.country ?? ""
        view.putSelectedCityInSearchBar(city: "\(city), \(country)")
    }
    // method called when delete a city from my saved cities
    func removeCity(index: Int) {
        let result = model.deleteCity(atRow: index)
        if result == true {
            model.fetchAllCities { [weak self] cities in
                self?.cities = cities ?? []
                self?.view.upadteCities()
            }
        }
    }
    
}
