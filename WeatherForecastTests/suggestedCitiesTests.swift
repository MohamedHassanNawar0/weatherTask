//
//  suggestedCitiesTests.swift
//  WeatherForecastTests
//
//  Created by Mohamed Nawar on 2/22/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import XCTest
@testable import WeatherTask
class suggestedCitiesTests: XCTestCase {
    
    let mainInteractor = MainInteractor()
     let weatherForecastteractor = ForecastInteractor()
          override func setUp() {
              continueAfterFailure = false
          }

        override func tearDown() {

    }
        
        func testDataRequest() {
            let exp = expectation(description: "server fetch")
            mainInteractor.getSuggestedCities(cityName: "cairo") { (suggestedCities, error) in
                if error != nil {
                    XCTFail()
                }
                XCTAssertNotNil(suggestedCities, "should not be nil")
                XCTAssertGreaterThan(suggestedCities?.list?.count ?? 0, 0, "should have values")
                exp.fulfill()
            }
            waitForExpectations(timeout: 0.6) { (error) in
                print (error?.localizedDescription ?? "")
                   }
        }
    
        func testFindPlacesParseJSON() {
                let bundle = Bundle(for: type(of: self))
                if let path = bundle.path(forResource: "FindPlacesJSON", ofType: "txt") {
                    if let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)) {
                        mainInteractor.parseJSON(data: data) { (suggestedCities, error) in
                            XCTAssertNotNil(suggestedCities, "should not be nil")
                            XCTAssertGreaterThan(suggestedCities?.list?.count ?? 0, 0, "should have values")
                        }
                    }
                    else {
                        XCTFail()
                    }
                }
                else {
                    XCTFail()
                }
            }
    
        func testSuggestedCities() {
            // This is an example of a performance test case.
            measure {
            let exp = expectation(description: "server fetch")
              let MainView = MainInteractor()
                MainView.getSuggestedCities(cityName: "Ale") { (suggestedCities, error) in
                    exp.fulfill()
                }
                waitForExpectations(timeout: 10.0, handler: { (error) in
                    print (error?.localizedDescription ?? "")
                })
            }
        }
    }
