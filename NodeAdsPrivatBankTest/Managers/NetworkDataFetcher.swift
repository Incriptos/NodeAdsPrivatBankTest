//
//  NetworkDataFetcher.swift
//  NodeAdsPrivatBankTest
//
//  Created by Andrew Vashulenko on 8/21/19.
//  Copyright © 2019 Andrew Vashulenko. All rights reserved.
//

import Foundation

class NetworkDataFetcher {
  
  var networkManager = NetworkManager()
  
  func fetchATMs(city: String, completion: @escaping (ATMModel?) -> ()) {
    
    networkManager.request(city: city) { (data, error) in
      
      if let error = error {
        print("Error received requesting data: \(error.localizedDescription)")
        completion(nil)
      }
      
      let decoded = self.decodeJSON(type: ATMModel.self, from: data)
      
      completion(decoded)
      
    }
    
  }
  
  private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
    let decoder = JSONDecoder()
    guard let data = from else { return nil }
    
    do {
      let object = try decoder.decode(type.self, from: data)
      return object
    } catch let jsonError {
      print("Failed to decode JSON", jsonError)
      return nil
    }
  }
  
}
