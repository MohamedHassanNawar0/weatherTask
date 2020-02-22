//
//  UpdateWeatherIcon.swift
//  WeatherTask
//
//  Created by Mohamed Nawar on 2/22/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import Foundation

    //This method turns a condition code into the name of the weather condition image to set image based on condition
func updateWeatherIcon(condition: Int) -> String {

switch (condition) {

    case 0...300 :
        return "tstorm1"
    
    case 301...500 :
        return "light_rain"

    case 501...600 :
        return "shower3"

    case 601...700 :
        return "snow4"

    case 701...771 :
        return "fog"

    case 772...800 :
        return "tstorm3"

    case 800 :
        return "sunny"

    case 801...804 :
        return "cloudy2"

    case 900...903, 905...1000  :
        return "tstorm3"

    case 903 :
        return "snow5"

    case 904 :
        return "sunny"

    default :
        return "dunno"
    }
}
