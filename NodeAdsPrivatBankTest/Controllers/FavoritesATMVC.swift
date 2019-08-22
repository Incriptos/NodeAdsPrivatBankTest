//
//  FavoritesATMVC.swift
//  NodeAdsPrivatBankTest
//
//  Created by Andrew Vashulenko on 8/20/19.
//  Copyright © 2019 Andrew Vashulenko. All rights reserved.
//

import UIKit

class FavoritesATMVC: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  var currentDevice: Device? {
    didSet {
      favoriteDevices.append(currentDevice!)
    }
  }
  
  var favoriteDevices = [Device]()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

      setupTableView()
      setupNavigation()
      tableView.reloadData()
      view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
      
    }
  
  private func setupTableView() {
    
    tableView.register(UINib(nibName: "FavoritesCell", bundle: nil), forCellReuseIdentifier: FavoritesCell.reusableId)
    
    tableView.separatorStyle = .none
    tableView.backgroundColor = .clear
    
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 50
    
  }
  
  private func setupNavigation() {
    
    navigationItem.title = "Ваши избраные банкоматы"
    
  }
  
}

extension FavoritesATMVC: UITableViewDataSource, UITableViewDelegate {
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return favoriteDevices.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesCell.reusableId, for: indexPath) as! FavoritesCell
    
//    let device = favoritesDevices[indexPath.row]
//
//    cell.cityLabel.text = device?.cityRU
//    cell.addressLabel.text = device?.fullAddressRu
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    
 //  let devace = favoritesDevices[indexPath.row]
    
    let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (_, _) in
      
      
      tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    return [deleteAction]
  }
  
}
 
