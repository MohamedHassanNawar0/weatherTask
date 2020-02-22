//
//  Entity+CoreDataClass.swift
//  
//
//  Created by Mohamed Nawar on 2/20/20.
//
//

import Foundation
import CoreData

@objc(City)
public class City: NSManagedObject {
    public override func awakeFromInsert() {
          super.awakeFromInsert()
          dateAdded = Date()
      }
}
