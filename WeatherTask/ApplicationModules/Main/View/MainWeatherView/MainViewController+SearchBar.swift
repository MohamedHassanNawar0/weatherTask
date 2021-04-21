//
//  MainViewController+SearchBarDelegate.swift
//  WeatherTask
//
//  Created by Mohamed Nawar on 2/22/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController: UISearchBarDelegate {
    // search bar design
    func setupSearchBar() {
        searchBar.delegate = self
        searchBar.barTintColor = UIColor.clear
        searchBar.searchTextField.textColor = .white
        searchBar.backgroundColor = UIColor.clear
        searchBar.isTranslucent = true
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
    }
    // click to search button
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        presenter.didPressSearch(name: searchBar.text!)
    }
    // get new data while changing data
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.SearchBarTextChanged(text: searchBar.text!)
    }
}
