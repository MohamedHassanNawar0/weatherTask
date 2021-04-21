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
    
    // Simulate a long waiting for fetching forecast weather for selected city
    internal func getForecastWeather(cityName: String, completionHundler: @escaping (ForecastDataModel?, String?) -> Void) {
        NetworkRequest().Request(url: APIs.Instance.getForecastBaseURL(selectedCity: cityName), method: .get, parameters: nil, headers: APIs.Instance.getHeader()){
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
    private func parseJSON(data : Data , completionHundler: @escaping (ForecastDataModel?, String?) -> Void) {
           do {
        let forecastDataModel = try  JSONDecoder().decode(ForecastDataModel.self,from:(data))
            completionHundler(forecastDataModel, nil)
            }catch{
                completionHundler(nil, error.localizedDescription)
        }
    }
}
