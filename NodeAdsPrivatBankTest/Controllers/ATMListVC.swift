//
//  ATMListVC.swift
//  NodeAdsPrivatBankTest
//
//  Created by Andrew Vashulenko on 8/20/19.
//  Copyright © 2019 Andrew Vashulenko. All rights reserved.
//

import UIKit
import CoreData

final class ATMListVC: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  private var fetcher = NetworkDataFetcher()
  private let persistenceManager = PersistenceManager.shared
  
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
  
  var city = UserDefaults.standard.string(forKey: "searchCity")
  
  private var isFavorites: Bool = false
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    

    
    fetchData()
    setupTableView()
    setupSearchBar()
    setupNavigation()
    
    view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    
  }
  
  //MARK: - Private funcs
  
  private func setupTableView() {
  
    tableView.register(UINib(nibName: "ATMCell", bundle: nil), forCellReuseIdentifier: ATMCell.reusableId)
    
    tableView.separatorStyle = .none
    tableView.backgroundColor = .clear
    
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 50
    
  }
  
  private func setupSearchBar() {
    
    searchController.searchResultsUpdater = self
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = "Поиск"
    navigationItem.searchController = searchController
    navigationItem.hidesSearchBarWhenScrolling = false
    definesPresentationContext = true
    
  }
  
  private func setupNavigation() {
    
    guard let searchCity = city else { return }
    
    navigationItem.title = "Банкоматы города: \(searchCity)"

  }
  
  private func fetchData() {
    
      guard let searchCity = city else { return }
    
    fetcher.fetchATMs(city: searchCity) { [weak self] (cityResults) in
      
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
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.deselectRow(at: indexPath, animated: true)
    
    let device = self.devices[indexPath.row]
    
    let alertController = UIAlertController(title: "Опции", message: device.fullAddressRu, preferredStyle: .actionSheet)
    
    let showInfoAction = UIAlertAction(title: "Показать подробнее", style: .default) { (action) in
      
      
      let detailVC: DetailVC = DetailVC.loadFromStoryboard()
      
      self.navigationController?.pushViewController(viewController: detailVC, completion: {
        
        detailVC.currentDevice = device
        
      })
    }
    
    let addToFavorite = UIAlertAction(title: "Добавить в избраное", style: .default) { (action) in
      //TODO: Седать добавление в любимые.
      
      self.isFavorites.toggle()
      
      let device = self.devices[indexPath.row]
      
      let coreAtm = Atm(context: self.persistenceManager.context)
      coreAtm.cityRU = device.cityRU
      coreAtm.fullAddressRu = device.fullAddressRu
      coreAtm.isFavorites = self.isFavorites
      
      self.persistenceManager.save()
      
    }
    let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
    alertController.addAction(showInfoAction)
    alertController.addAction(addToFavorite)
    alertController.addAction(cancelAction)
    self.present(alertController, animated: true)
    
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
