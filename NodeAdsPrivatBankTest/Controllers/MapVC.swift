//
//  MapVC.swift
//  NodeAdsPrivatBankTest
//
//  Created by Andrew Vashulenko on 8/22/19.
//  Copyright © 2019 Andrew Vashulenko. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {
  
  @IBOutlet weak var mapView: MKMapView!
  
  var mapDevice: Device? {
    didSet {
      showDeviceMap(long: mapDevice!.longitude, lati: mapDevice!.latitude, placeName: mapDevice!.placeRu)
    }
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    navigationController?.popToRootViewController(animated: true)
  }
  
 private func showDeviceMap(long: String, lati: String, placeName: String) {
  
  let convertLati = Double(lati)
  let convertLong = Double(long)
    
  let initialLocation = CLLocation(latitude: convertLati!, longitude: convertLong!)
  centerMapOnLocation(location: initialLocation)
  addPin(lati: convertLati!, long: convertLong!, name: placeName)
    
  }

 private func addPin(lati: Double, long: Double, name: String) {
    let annotation = MKPointAnnotation()
    let centerCoordinate = CLLocationCoordinate2D(latitude: lati, longitude: long)
    annotation.coordinate = centerCoordinate
    annotation.title = name
    mapView.addAnnotation(annotation)
  }
  
 private func centerMapOnLocation(location: CLLocation) {
  
    let regionRadius: CLLocationDistance = 1000
  
    let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                              latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
    mapView.setRegion(coordinateRegion, animated: true)
  }

}
