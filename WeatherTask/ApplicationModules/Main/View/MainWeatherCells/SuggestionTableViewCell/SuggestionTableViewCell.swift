//
//  SuggestionTableViewCell.swift
//  WeatherTask
//
//  Created by Mohamed Nawar on 2/21/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import UIKit

class SuggestionTableViewCell: UITableViewCell {
    @IBOutlet weak var suggestionCityLabel: UILabel!
}

extension SuggestionTableViewCell: SuggestedCitiesCellView {

    func displaySuggestedCity(cityName: String) {
        suggestionCityLabel.text = cityName
    }
}
