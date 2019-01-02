//
//  CoreDataStack.swift
//  Advance Core Data
//
//  Created by Dhawal Mahajan on 16/12/18.
//  Copyright © 2018 Dhawal Mahajan. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
//    static let sharedInstance = CoreDataStack()
    var container: NSPersistentContainer {
        let container = NSPersistentContainer(name: "Todos")
        container.loadPersistentStores { (description, error) in
            guard error == nil else {
                print("Error: \(String(describing: error))")
                return
            }
        }
        return container
    }
    
    var managedContext: NSManagedObjectContext {
        return container.viewContext
    }
}
