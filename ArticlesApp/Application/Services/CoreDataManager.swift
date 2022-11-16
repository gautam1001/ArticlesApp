//
//  CoreDataManager.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 15/11/22.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared: CoreDataManager = CoreDataManager()
    // Main and background context
    var mainContext: NSManagedObjectContext! // Read only context
    var backgroundContext: NSManagedObjectContext! // Write only context

    // get default context
    var defaultContext: NSManagedObjectContext {
        if Thread.isMainThread {
            return mainContext
        } else {
            return backgroundContext
        }
    }
    
    private init() {
        mainContext = persistentContainer.viewContext
        mainContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        backgroundContext = persistentContainer.newBackgroundContext()
        //backgroundContext.parent = mainContext
        backgroundContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        getCoreDataDBPath()
    }
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ArticlesAppPersistance")
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func fetchManagedObject<T: NSManagedObject>(managedObject: T.Type) throws -> [T]?
    {
        do {
            guard let result = try mainContext.fetch(managedObject.fetchRequest()) as? [T] else {return nil}

            return result

        } catch let error {
            throw error
        }
    }
    
    func getCoreDataDBPath() {
            let path = FileManager
                .default
                .urls(for: .applicationSupportDirectory, in: .userDomainMask)
                .last?
                .absoluteString
                .replacingOccurrences(of: "file://", with: "")
                .removingPercentEncoding

            print("Core Data DB Path :: \(path ?? "Not found")")
        }
}
