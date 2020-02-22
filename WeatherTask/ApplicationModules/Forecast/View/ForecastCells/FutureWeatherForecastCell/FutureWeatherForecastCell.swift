//
//  FutureWeatherForecastCell.swift
//  WeatherTask
//
//  Created by Mohamed Nawar on 2/21/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import UIKit

class FutureWeatherForecastCell: UITableViewCell {
    @IBOutlet weak var tempretureLabel: UILabel!
    @IBOutlet weak var tempretureImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
}

extension FutureWeatherForecastCell:ForecastWeatherCell {
    func displayDate(date: String) {
        dateLabel.text = date
    }
    
    func displayTempreture(tempreture: Int) {
        tempretureLabel.text = "\(tempreture)"
    }
    
    func displayImage(imageNameBasedOnCondition: String) {
        tempretureImage.image = UIImage(named: imageNameBasedOnCondition)
    }
}
