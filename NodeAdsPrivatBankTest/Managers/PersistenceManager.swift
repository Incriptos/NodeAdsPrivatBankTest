//
//  CoreDataManager.swift
//  NodeAdsPrivatBankTest
//
//  Created by Andrew Vashulenko on 8/22/19.
//  Copyright © 2019 Andrew Vashulenko. All rights reserved.
//

import Foundation
import CoreData

final class PersistenceManager {
  private init() {}
  static let shared = PersistenceManager()
  
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "Atms")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
  
  lazy var context = persistentContainer.viewContext
}

//MARK: - Core Data Saving support
extension PersistenceManager {
  func save() {
    if context.hasChanges {
      do {
        try context.save()
        print("saved successfully")
        
        
      } catch {
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
  
  func fetch<T: NSManagedObject>(_ objectType: T.Type) -> [T] {
    let entityName = String(describing: objectType)
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
    do {
      let fetchedObjects = try context.fetch(fetchRequest) as? [T]
      return fetchedObjects ?? [T]()
      
    } catch {
      print(error)
      return [T]()
    }
  }
  
  func delete(_ object: NSManagedObject) {
    context.delete(object)
    save()
  }
}
