//
//  Mammal+CoreDataProperties.swift
//  CoreDataInheritance
//
//  Created by Randall Mardus on 2/18/16.
//  Copyright © 2016 Randall Mardus. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Mammal {

    @NSManaged var age: NSNumber?
    @NSManaged var environment: String?
    @NSManaged var name: String?

}
