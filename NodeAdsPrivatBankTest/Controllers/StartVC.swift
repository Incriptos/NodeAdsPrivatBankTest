//
//  StartVC.swift
//  NodeAdsPrivatBankTest
//
//  Created by Andrew Vashulenko on 8/23/19.
//  Copyright © 2019 Andrew Vashulenko. All rights reserved.
//

import UIKit

class StartVC: UIViewController {

  @IBOutlet weak var cityTextField: UITextField! {
    didSet {
      cityTextField.text = "Киев"
    }
  }
  
  @IBOutlet weak var searchButton: UIButton!
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    self.navigationController?.isNavigationBarHidden = true
   
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()

    searchButton.layer.cornerRadius = 10
    searchButton.layer.shadowColor =  UIColor.black.cgColor
    searchButton.layer.shadowOpacity = 0.3
    searchButton.layer.shadowOffset = CGSize.zero
    searchButton.layer.shadowRadius = 8
    
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    UserDefaults.standard.removeObject(forKey: "searchCity")
    UserDefaults.standard.synchronize()
    guard let text = cityTextField.text else {
      return
    }
   UserDefaults.standard.set("\(text)", forKey: "searchCity")
    
  
  }
  
  
  @IBAction func searchAction(_ sender: Any) {
    
    let tabBar: TabBarController = TabBarController()
    navigationController?.pushViewController(tabBar, animated: true)
  
  }
}
