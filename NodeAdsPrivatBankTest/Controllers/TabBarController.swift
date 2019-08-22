//
//  TabBarController.swift
//  NodeAdsPrivatBankTest
//
//  Created by Andrew Vashulenko on 8/20/19.
//  Copyright © 2019 Andrew Vashulenko. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let ATMList: ATMListVC = ATMListVC.loadFromStoryboard()
    let favoritesATM: FavoritesATMVC = FavoritesATMVC.loadFromStoryboard()
    
    viewControllers = [generateNavigationController(rootViewController: ATMList,
                                                    title: "Банкоматы",
                                                    image: UIImage(named: "list")!),
                       generateNavigationController(rootViewController: favoritesATM,
                                                    title: "Избраные",
                                                    image: UIImage(named: "fav")!)]

  }
  
  private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
    
    let navigationController = UINavigationController(rootViewController: rootViewController)
    navigationController.tabBarItem.title = title
    navigationController.tabBarItem.image = image
    
   return navigationController
  }
  
}

