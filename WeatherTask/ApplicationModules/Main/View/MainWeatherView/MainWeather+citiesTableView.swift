//
//  MainWeather+TableView.swift
//  WeatherTask
//
//  Created by Mohamed Nawar on 2/20/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    //MARK: - setup tableViewDataSource and tableViewDelegate
    func setupTableView(tableView:UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
    }
    // method used to show suggestion table view and hide my saved cities table view
    func showSuggestionTable() {
        self.citiesTableView.isHidden = true
        self.suggestionTableViewView.isHidden = false
    }
    // method used to show my saved cities table view and hide suggestion table view
    func showSavedCitiesTable() {
        self.suggestionTableViewView.isHidden = true
        self.citiesTableView.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case citiesTableView:
            return presenter.numberOfCities
        case suggestionTableView :
            if presenter.getCitiesCount() > 0 {
                showSuggestionTable()
            }else{
                showSavedCitiesTable()
            }
            return presenter.getCitiesCount()
        default:
            print("Some Things Wrong!!")
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case citiesTableView:
            let CityCell = tableView.dequeueReusableCell(CitiesTableViewCell.self, for: indexPath)
            presenter.configureCitiesTableViewCell(cell: CityCell, for: indexPath.row)
            return CityCell
        case suggestionTableView :
            let suggestionCell = tableView.dequeueReusableCell(SuggestionTableViewCell.self, for: indexPath)
            presenter.configureSuggestionTableViewCell(cell: suggestionCell, for: indexPath.row)
            return suggestionCell
            
        default:
            print("Some Things Wrong!!")
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        presenter.removeCity(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case citiesTableView:
            presenter.didSelectCityRow(index: indexPath.row)
        case suggestionTableView :
            presenter.didSelectSuggestedCityRow(index: indexPath.row)
            showSavedCitiesTable()
        default:
            print("Some Things Wrong!!")
        }
    }
    
}
