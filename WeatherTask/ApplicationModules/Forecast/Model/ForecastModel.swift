//
//  ForecastModel.swift
//  WeatherTask
//
//  Created by Mohamed Nawar on 2/20/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import Foundation

//Declare your model variables here
struct ForecastDataModel:Decodable {
    var list : [ForecastDataModelData]?
    var city : CityData?
}
struct CityData:Decodable {
    var name : String?
    var country : String?
}
struct ForecastDataModelData:Decodable {
    var dt_txt : String?
    var main : ForecastMainData?
    var weather: [WeatherData]?
    var name: String?
    var sys : SysData?
}
struct SysData:Decodable {
    var country : String?
}
struct ForecastMainData:Decodable {
    var temp : Double?
}

struct WeatherData:Decodable {
    var id : Int?
}
