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
  
  private var fetcher = NetworkDataFetcher()
  
  private var devices = [Device]()
  private var filtredDevices = [Device]()
  
  private let searchController = UISearchController(searchResultsController: nil)
  private var searchBarIsEmpty: Bool {
    guard let text = searchController.searchBar.text else { return false }
    return text.isEmpty
  }
  private var isFiltering: Bool {
    return searchController.isActive && !searchBarIsEmpty
  }
  
  private var city = "Киев"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    fetchData()
    setupTableView()
    setupSearchBar()
    
    
    view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    
  }
  
  //MARK: - Private funcs
  
  private func setupTableView() {
  
    tableView.register(UINib(nibName: "ATMCell", bundle: nil), forCellReuseIdentifier: ATMCell.reusableId)
    
    tableView.separatorStyle = .none
    tableView.backgroundColor = .clear

  }
  
  private func setupSearchBar() {
    
    searchController.searchResultsUpdater = self
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = "Поиск"
    navigationItem.searchController = searchController
    definesPresentationContext = true
    
  }
  
  private func fetchData() {
    fetcher.fetchATMs(city: city) { [weak self] (cityResults) in
      
      guard let cityResult = cityResults else { return }
      self?.devices = cityResult.devices
      self?.tableView.reloadData()
    }
  }
  
  
}

//MARK: - UITableViewDataSource, UITableViewDelegate

extension ATMListVC: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if isFiltering {
      return filtredDevices.count
    } else {
      return devices.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ATMCell.reusableId, for: indexPath) as! ATMCell
    
    let device = isFiltering ? filtredDevices[indexPath.row] : devices[indexPath.row]
    
    cell.cityLabel.text = device.cityRU
    cell.addressLabel.text = device.fullAddressRu

    return cell
  }
  
}

//MARK: - UISearchResultsUpdating

extension ATMListVC: UISearchResultsUpdating {
  
  func updateSearchResults(for searchController: UISearchController) {
    
     filredContentForSearchText(searchController.searchBar.text!)
    
  }
  
  private func filredContentForSearchText(_ searchText: String) {
    
    filtredDevices = devices.filter({ (device: Device) -> Bool in
      return device.fullAddressRu.lowercased().contains(searchText.lowercased())
    })
    
    tableView.reloadData()
    
  }
  
}
