//
//  ATMListVC.swift
//  NodeAdsPrivatBankTest
//
//  Created by Andrew Vashulenko on 8/20/19.
//  Copyright © 2019 Andrew Vashulenko. All rights reserved.
//

import UIKit

class ATMListVC: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var fetcher = NetworkDataFetcher()
  private var devices = [Device]()
  
  private var city = "Киев"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupTableView()
    fetchData()

    
    view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    
  }
  
  private func setupTableView() {
  
    tableView.register(UINib(nibName: "ATMCell", bundle: nil), forCellReuseIdentifier: ATMCell.reusableId)
    
    tableView.separatorStyle = .none
    tableView.backgroundColor = .clear

  }
  
  private func fetchData() {
    fetcher.fetchATMs(city: city) { [weak self] (cityResults) in
      
      guard let cityResult = cityResults else { return }
      self?.devices = cityResult.devices
      self?.tableView.reloadData()
    }
  }
  
  
}

extension ATMListVC: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return devices.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ATMCell.reusableId, for: indexPath) as! ATMCell
    
    let device = devices[indexPath.row]

    cell.cityLabel.text = device.cityRU
    cell.addressLabel.text = device.fullAddressRu

    
    return cell
  }
  
}
