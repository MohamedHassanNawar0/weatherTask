//
//  ForecastWeatherPresenter.swift
//  WeatherTask
//
//  Created by Mohamed Nawar on 2/20/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import Foundation

class ForecastWeatherPresenter:SaveCityData{
    
    private weak var view: ForecastWeatherView?
    private let interactor = ForecastInteractor()
    private var forecastWeather = ForecastDataModel()
    private(set) var model: CityListModelInput
    
    init(view: ForecastWeatherView,model: CityListModelInput ) {
        self.view = view
        self.model = model
    }
    // method called to get forecast weather for current city
    func viewLoadData(name:String) {
        getForecastWeather(name: name)
    }
    // method called to add current city to my saved cities list
    func saveCityData() {
        let cityName = forecastWeather.city?.name ?? ""
        let countryName = forecastWeather.city?.country ?? ""
        let tempResult  = forecastWeather.list?.first?.main?.temp ?? 0
        let tempreture = "\(Int(tempResult - 273.15) )"
        model.registerCity(name: "\(cityName), \(countryName)", tempreture: tempreture, completion: { [weak self] message in
            self?.view?.showMessage(message: message ?? "")
            print(message ?? "")
        })
    }
    // method called to request forecast weather for selected city
    func getForecastWeather(name:String) {
        view?.showIndicator()
        interactor.getForecastWeather(cityName: name) { [weak self] (forecastWeather, error) in
                        guard let self = self else { return }
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showMessage(message: error)
            } else {
                guard let weatherData = forecastWeather else { return }
                self.forecastWeather = weatherData
                self.view?.fetchingDataSuccess()
            }
        }
    }
    //method to return number of forecast weather for selected city
    func getForecastWeather() -> Int {
        print(forecastWeather.list?.count ?? 0)
        return forecastWeather.list?.count ?? 0
    }
   //configure Forecast Weather Cell
    func configure(cell: ForecastWeatherCell, for index: Int) {
        let date = forecastWeather.list?[index].dt_txt?.toDate(format: "yyyy-MM-dd HH:mm:ss")?.asStringToDate() ?? ""
        let time = forecastWeather.list?[index].dt_txt?.toDate(format: "yyyy-MM-dd HH:mm:ss")?.asStringToTime() ?? ""
        cell.displayDate(date: "\(date) \n \(time)")
        let tempResult = forecastWeather.list?[index].main?.temp ?? 0
        cell.displayTempreture(tempreture:Int(tempResult - 273.15))
        let tepretureID = forecastWeather.list?[index].weather?.first?.id ?? 0
        let image = updateWeatherIcon(condition:tepretureID )
        cell.displayImage(imageNameBasedOnCondition:image)
    }
}
