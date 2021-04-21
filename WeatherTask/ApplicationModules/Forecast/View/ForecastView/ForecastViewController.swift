//
//  ForecastViewController.swift
//  WeatherTask
//
//  Created by Mohamed Nawar on 2/20/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import UIKit

class ForecastViewController: BaseViewController {
    //MARK: - Outlets and variable
    @IBOutlet weak var forecastTableView: UITableView!
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    var cityName:String?
    private(set) var forecastPresenter: ForecastWeatherPresenter!
    
    //MARK: - Screen Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        self.title = cityName
        setupActivityIndicator()
        forecastPresenter.viewLoadData(name:cityName ?? "")
    }
    //MARK: - helper methods
    func inject(forecastPresenter: ForecastWeatherPresenter) {
        self.forecastPresenter = forecastPresenter
    }
    
    @IBAction func saveCurrentCity(_ sender: Any) {
        forecastPresenter.saveCityData()
    }
    //MARK: - setup Activity Indicator
    func setupActivityIndicator() {
        activityIndicator.center = view.center
    }
    func activityIndicator (isStart : Bool){
        if isStart{
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
        }else{
            activityIndicator.removeFromSuperview()
            activityIndicator.stopAnimating()
        }
    }
}
