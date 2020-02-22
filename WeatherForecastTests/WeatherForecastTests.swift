//
//  WeatherForecastTests.swift
//  WeatherForecastTests
//
//  Created by Mohamed Nawar on 2/22/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import XCTest
@testable import WeatherTask
class WeatherForecastTests: XCTestCase {
    let weatherForecastinteractor = ForecastInteractor()

    override func setUp() {
          continueAfterFailure = false
          
      }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testDataRequest() {
        let exp = expectation(description: "server fetch")
        weatherForecastinteractor.getForecastWeather(cityName: "cairo") { (suggestedCities, error) in
            if error != nil {
                XCTFail()
            }
            XCTAssertNotNil(suggestedCities, "should not be nil")
            XCTAssertGreaterThan(suggestedCities?.list?.count ?? 0, 0, "should have values")
            exp.fulfill()
        }
        waitForExpectations(timeout: 5) { (error) in
            print (error?.localizedDescription ?? "")
               }
    }
    
    func testSuggestedCities() {
        // This is an example of a performance test case.
        measure {
        let exp = expectation(description: "server fetch")
            let forecastWeatherView = ForecastInteractor()
            forecastWeatherView.getForecastWeather(cityName: "Ale") { (weatherForecast, error) in
                exp.fulfill()
            }
            waitForExpectations(timeout: 10.0, handler: { (error) in
                print (error?.localizedDescription ?? "")
            })
        }
    }
}
