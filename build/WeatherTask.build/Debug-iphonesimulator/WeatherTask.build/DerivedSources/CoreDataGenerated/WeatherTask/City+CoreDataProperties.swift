//
//  City+CoreDataProperties.swift
//  
//
//  Created by Mohamed Nawar on 2/22/20.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension City {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "City")
    }

    @NSManaged public var cityname: String?
    @NSManaged public var dateAdded: Date?
    @NSManaged public var tempreture: String?

}
