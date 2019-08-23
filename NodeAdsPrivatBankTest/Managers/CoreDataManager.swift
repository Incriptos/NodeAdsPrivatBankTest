//
//  CoreDataManager.swift
//  NodeAdsPrivatBankTest
//
//  Created by Andrew Vashulenko on 8/23/19.
//  Copyright © 2019 Andrew Vashulenko. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
  
  private override init(){}
  
  static let shared = CoreDataManager()
  
  private func getContext()->NSManagedObjectContext{
    return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  }
  
  func saveObject(cityRU: String, fullAddressRu: String, isFavorites: Bool, completion: @escaping (Bool) -> ()) {
    let entity = NSEntityDescription.entity(forEntityName: "Atm", in: getContext())
    let managedObject = NSManagedObject(entity: entity!, insertInto: getContext())
    
    //сохраняем все данные
    managedObject.setValue(cityRU, forKey: "cityRU")
    managedObject.setValue(fullAddressRu, forKey: "fullAddressRu")
    managedObject.setValue(isFavorites, forKey: "isFavorites")

    do{
      try getContext().save()
      completion(true)
    } catch {
      completion(false)
    }
  }
  
  func fetchObject() {
    let fetchRequest:NSFetchRequest<Atm> = Atm.fetchRequest()
    
    do {
      favoritesDevices = try getContext().fetch(fetchRequest)
      
    } catch let error as NSError {
        print("Could not fetch. \(error)")
    }
  }
  
  //delete single contact
  func deleteObject(_ device: NSManagedObject, at indexPath: IndexPath) {
    getContext().delete(device)
    do {
      try getContext().save()
      favoritesDevices.remove(at: indexPath.row)
    } catch {
      print(error)
    }
  }
  
}
