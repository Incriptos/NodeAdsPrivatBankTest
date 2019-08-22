//
//  DetailVC.swift
//  NodeAdsPrivatBankTest
//
//  Created by Andrew Vashulenko on 8/21/19.
//  Copyright © 2019 Andrew Vashulenko. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var fullAddressLabel: UILabel!
  @IBOutlet weak var placeLabel: UILabel!
  @IBOutlet weak var workTimeLabel: UILabel!
  @IBOutlet weak var mapButton: UIButton!
  
  var currentDevice: Device? {
    didSet {
      guard let currentDevice = currentDevice else { return }
      cityLabel.text = currentDevice.cityRU
      fullAddressLabel.text = currentDevice.fullAddressRu
      placeLabel.text = currentDevice.placeRu
      workTimeLabel.text = "Режим работы банкомата:\n Понедельник: \(currentDevice.tw.mon)\n Вторник: \(currentDevice.tw.thu)\n Среда: \(currentDevice.tw.wed)\n Четверг: \(currentDevice.tw.thu)\n Пятница: \(currentDevice.tw.fri)\n Суббота: \(currentDevice.tw.sat)\n Воскресенье: \(currentDevice.tw.sun)\n"
    }
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    mapButton.layer.cornerRadius = 10
    // add shadow
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigation()
    
  }
  
  
  private func setupNavigation() {
    
    if let topItem = navigationController?.navigationBar.topItem {
      topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    navigationItem.title = "Подробная информация"
  }
  
  @IBAction func showMapAction(_ sender: Any) {
    
    let mapVC: MapVC = MapVC.loadFromStoryboard()
    self.navigationController?.pushViewController(viewController: mapVC, completion: {
      mapVC.mapDevice = self.currentDevice
    })
  }
  

}
