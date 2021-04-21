//
//  CitiesTableViewCell.swift
//  WeatherTask
//
//  Created by Mohamed Nawar on 2/20/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import UIKit


class CitiesTableViewCell: UITableViewCell {
    private(set) static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
}

extension CitiesTableViewCell: MainCitiesCellView {
    func displayDate(date: Date) {
        dateLabel.text = CitiesTableViewCell.dateFormatter.string(from: date)
    }
    func displayCity(cityName: String) {
        cityNameLabel.text = cityName
    }
}
