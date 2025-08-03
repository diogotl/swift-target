//
//  CoreDataHelper.swift
//  crud-events
//
//  Created by Diogo on 03/08/2025.
//


import Foundation
import CoreData

class CoreDataHelper {
    static let shared = CoreDataHelper()
    let persistentContainer: NSPersistentContainer

    private init() {
        persistentContainer = NSPersistentContainer(name: "CoreData")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data stack failed: \(error)")
            }
        }
    }

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            try? context.save()
        }
    }
}
