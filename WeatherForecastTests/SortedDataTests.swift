//
//  SortedDataTests.swift
//  WeatherForecastTests
//
//  Created by Mohamed Nawar on 2/22/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import XCTest
import CoreData
@testable import WeatherTask
class SortedDataTests: XCTestCase {
    var coreDataStack: CoreDataStack!
    var sortedCities: CityListModel?
    override func setUp() {
        coreDataStack = CoreDataStack()
        sortedCities = CityListModel(modelContext: coreDataStack!.modelContext)
    }
    
    func testAddCity() {
        let exp = expectation(description: "server fetch")
        sortedCities?.registerCity(name: "cairo", tempreture: "20") { (message) in
            print(message ?? "")
            XCTAssertEqual(message, "This city has been added successfully", "AddedSuccessfully")
            exp.fulfill()
        }
        waitForExpectations(timeout: 5) { (error) in
                   print (error?.localizedDescription ?? "")
                      }
    }
    
    func testDeleteCity() {
          let result = sortedCities?.deleteCity(atRow: 0)
            XCTAssertEqual(result, true , "Deleted Successfully")
        
    }
    
    func testFetchSortedCities() {
        let exp = expectation(description: "server fetch")
        sortedCities?.fetchAllCities { (cities) in
            if cities == nil {
                XCTFail()
            }
            XCTAssertNotNil(cities, "should not be nil")
            XCTAssertGreaterThan(cities?.count ?? 0, 0, "should have values")
            exp.fulfill()
        }
        waitForExpectations(timeout: 5) { (error) in
            print (error?.localizedDescription ?? "")
               }
    }
    
    override func tearDown() {
      }
    
    func testPerformanceSorteCities() {
        self.measure {
            let exp = expectation(description: "server fetch")
            sortedCities?.registerCity(name: "cairo", tempreture: "20") { (message) in
                print(message ?? "")
                    exp.fulfill()
                   }
            waitForExpectations(timeout: 10.0, handler: { (error) in
                print (error?.localizedDescription ?? "")
            })
        }
    }
    
    func testPerformanceFetchCitiesList() {
        self.measure {
            let exp = expectation(description: "server fetch")
            sortedCities?.fetchAllCities { (cities) in
                    exp.fulfill()
                   }
            waitForExpectations(timeout: 10.0, handler: { (error) in
                print (error?.localizedDescription ?? "")
            })
        }
    }
}
