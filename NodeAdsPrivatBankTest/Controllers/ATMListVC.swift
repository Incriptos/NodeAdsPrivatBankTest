//
//  ATMListVC.swift
//  NodeAdsPrivatBankTest
//
//  Created by Andrew Vashulenko on 8/20/19.
//  Copyright © 2019 Andrew Vashulenko. All rights reserved.
//

import UIKit

class ATMListVC: UIViewController {
  
  var networking = NetworkManager()
  var fetcher = NetworkDataFetcher()
  
  private var city = "Киев"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    fetcher.fetchATMs(city: city) { (result) in
      print()
    }
    
  
    view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    
  }
}

