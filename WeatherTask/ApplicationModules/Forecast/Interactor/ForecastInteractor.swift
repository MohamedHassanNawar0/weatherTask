//
//  ForecastInteractor.swift
//  WeatherTask
//
//  Created by Mohamed Nawar on 2/20/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import Foundation


protocol APIServiceForecastWeatherProtocol {
    func getForecastWeather(cityName: String , completionHundler: @escaping (ForecastDataModel?,String?) -> Void)
}

class ForecastInteractor: APIServiceForecastWeatherProtocol {

    fileprivate let AppId = "e72ca729af228beabd5d20e3b7749713"
    fileprivate let weatherForecastEndpoint = "http://api.openweathermap.org/data/2.5/forecast"
    
    // Simulate a long waiting for fetching forecast weather for selected city
    func getForecastWeather(cityName: String, completionHundler: @escaping (ForecastDataModel?, String?) -> Void) {
         let par = ["q":"\(cityName)" , "appid" : AppId]
      NetworkRequest().Request(url: weatherForecastEndpoint, method: .get, parameters: par, headers: nil){
            response , error in
            if response == nil && error == nil{
                completionHundler(nil,nil)
            }else{
                if error == nil{
                  self.parseJSON(data: response?.data ?? Data(), completionHundler: {
                        (suggestedCities , error) in
                    if error == nil{
                        completionHundler(suggestedCities, nil)
                    }else{
                        completionHundler(nil, error)
                    }
                    })
                }else{
                    completionHundler(nil, error?.message)
                }
            }
        }
    }
    //method used to parse respone
    func parseJSON(data : Data , completionHundler: @escaping (ForecastDataModel?, String?) -> Void) {
           do {
        let forecastDataModel = try  JSONDecoder().decode(ForecastDataModel.self,from:(data))
            completionHundler(forecastDataModel, nil)
            }catch{
                completionHundler(nil, error.localizedDescription)
        }
    }
}
