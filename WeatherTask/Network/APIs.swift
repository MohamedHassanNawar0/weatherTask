//
//  API.swift
//  WeatherTask
//
//  Created by Mohamed Hassan Nawar on 11/04/2021.
//  Copyright © 2021 Mohamed Hassan Nawar. All rights reserved.
//

import Foundation

class APIs {
    static let Instance = APIs()
    private init() {}
    fileprivate let AppId = "357d5c7ec91a050ae39c35220abea93a"
    private let url = "http://api.openweathermap.org/data/2.5/"
    public func getHeader() -> [String: String]{
        let header = [
            "Accept" : "application/json" , "Content-Type": "charset=utf-8"]
        return header
    }
}
extension APIs {
    public func getForecastBaseURL(selectedCity: String) -> String {
        let forecastUrl = url + "forecast?appid=\(AppId)&q=\(selectedCity)"
        guard let urlEncoded = forecastUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return ""}
        return urlEncoded
    }
    
    public func getCityBaseURL(cityName: String) -> String {
        return url + "find?appid=\(AppId)&q=\(cityName)"
    }
}
