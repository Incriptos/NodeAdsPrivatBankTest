//
//  ATMModel.swift
//  NodeAdsPrivatBankTest
//
//  Created by Andrew Vashulenko on 8/20/19.
//  Copyright © 2019 Andrew Vashulenko. All rights reserved.
//

import Foundation


struct ATMModel: Decodable {
  
  let city: String
  let adress: String?
  let devices: [Device]
  
}

struct Device: Decodable {
  
  let type: String
  let cityRU: String
  let fullAddressRu: String
  let placeRu: String
  let latitude: String
  let longitude: String
  let tw: Tw
  
}

struct Tw: Decodable {
  let mon, tue, wed, thu: String
  let fri, sat, sun, hol: String
}
