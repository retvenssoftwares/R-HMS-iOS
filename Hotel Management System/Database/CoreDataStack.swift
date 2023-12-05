//
//  CoreDataStack.swift
//  Hotel Management System
//
//  Created by Mayur Bobade on 04/12/23.
//

import Foundation
import CoreData


class CoreDataStack {
    static let shared = CoreDataStack()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ConfigDatabase")
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    // Add additional methods as needed, such as saving changes to the context
}


