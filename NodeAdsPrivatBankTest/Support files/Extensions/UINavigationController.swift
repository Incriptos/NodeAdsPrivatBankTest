//
//  UINavigationController.swift
//  NodeAdsPrivatBankTest
//
//  Created by Andrew Vashulenko on 8/22/19.
//  Copyright © 2019 Andrew Vashulenko. All rights reserved.
//

import UIKit

extension UINavigationController {
  
  func pushViewController(viewController: UIViewController, completion: @escaping ()->()) {
    CATransaction.begin()
    CATransaction.setCompletionBlock(completion)
    self.pushViewController(viewController, animated: true)
    CATransaction.commit()
  }
}
