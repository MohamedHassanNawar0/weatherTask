//
//  WeatherDataModel.swift
//  WeatherTask
//
//  Created by Mohamed Nawar on 2/20/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import Foundation
import CoreData

protocol CityListModelInput {
    func fetchAllCities(completion: @escaping ([City]?) -> ())
    func registerCity(name: String, tempreture: String , completion: @escaping (String?) -> ())
    func deleteCity(atRow row : Int) -> Bool
}

 class CityListModel: CityListModelInput {
    private let modelContext: NSManagedObjectContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "City")
    init(modelContext: NSManagedObjectContext) {
        self.modelContext = modelContext
    }

    func fetchAllCities(completion: @escaping ([City]?) -> ()) {
        let  cities = getSortedCities()
            completion(cities)
    }
    
    func checkIfCityIsAlreadySaved(name:String) -> Bool {
        let cities = getSortedCities()
        return cities.contains(where: { $0.cityname == name })
    }
    func getSortedCities() -> [City]{
        let result = try? modelContext.fetch(fetchRequest)
        let resultData = result as! [City]
        return resultData
    }
    func registerCity(name: String, tempreture: String , completion: @escaping (String?) -> ()) {
        if checkIfCityIsAlreadySaved(name: name) {
            print(name)
            completion("This city has already been saved")
        }else if getSortedCities().count >= 3 {
            completion("You have 3 cities saved, and you have to add up to 3 cities only")
        }else{
            storeCity(name: name, tempreture: tempreture)
            completion("This city has been added successfully")
        }
    }
    func storeCity(name: String, tempreture: String) {
        let city = NSEntityDescription.insertNewObject(forEntityName: "City", into: modelContext) as! City
        city.cityname = name
        city.tempreture = tempreture
        if modelContext.hasChanges {
            do {
                try modelContext.save()
            } catch let error as NSError {
                print("Core Data Error: \(error), \(error.userInfo)")
            }
        }
    }
    func deleteCity(atRow row : Int) -> Bool {
        let resultData = getSortedCities()
        if resultData.count > 0 {
        modelContext.delete(resultData[row] as NSManagedObject)
        do {
        try modelContext.save()
            return true
        } catch {
            print(error)
            return false
        }
        }
        return false
    }
}
