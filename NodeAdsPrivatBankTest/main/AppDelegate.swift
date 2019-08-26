//
//  AppDelegate.swift
//  NodeAdsPrivatBankTest
//
//  Created by Andrew Vashulenko on 8/20/19.
//  Copyright © 2019 Andrew Vashulenko. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    window = UIWindow()
    window?.makeKeyAndVisible()
    let startVC: StartVC = StartVC.loadFromStoryboard()
    let navigationController = UINavigationController(rootViewController: startVC)
    window?.rootViewController = navigationController
    
    return true
  }

//  func applicationDidEnterBackground(_ application: UIApplication) {
//    ///Clear CoreData
//    let persistenceManager = PersistenceManager.shared
//    let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "Atm"))
//    do {
//      try persistenceManager.context.execute(DelAllReqVar)
//    }
//    catch {
//      print(error)
//    }
//  }
  
}

