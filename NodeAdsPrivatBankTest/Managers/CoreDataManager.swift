//
//  CoreDataManager.swift
//  NodeAdsPrivatBankTest
//
//  Created by Andrew Vashulenko on 8/22/19.
//  Copyright © 2019 Andrew Vashulenko. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager {

  
  private init() {}
  
  static var context: NSManagedObjectContext {
    return persistentContainer.viewContext
  }
  
  // MARK: - Core Data stack
  
  static var persistentContainer: NSPersistentContainer = {

    let container = NSPersistentContainer(name: "NodeAdsPrivatBankTest")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
    
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
  
  // MARK: - Core Data Saving support
  
 static func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
  
        
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
  
  
  
}
