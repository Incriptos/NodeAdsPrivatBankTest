//
//  CoreDataManager.swift
//  NodeAdsPrivatBankTest
//
//  Created by Andrew Vashulenko on 8/23/19.
//  Copyright © 2019 Andrew Vashulenko. All rights reserved.
//

import UIKit
import CoreData


final class PersistenceManager {
  private init() {}
  static let shared = PersistenceManager()
  
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "NodeAdsPrivatBankTest")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
  
  lazy var context = persistentContainer.viewContext
  
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

  func fetchData<T: NSManagedObject>(_ objectType: T.Type, completion: @escaping ([T]) -> Void ) {
    
    let fetchRequest = NSFetchRequest<T>(entityName: String(describing: objectType))
    
    do {
      let objects = try context.fetch(fetchRequest)
      completion(objects)
    } catch  {
      print(error)
      completion([])
    }
  }
  
  
    func delete(_ object: NSManagedObject) {
      context.delete(object)
      save()
    }
  
}
