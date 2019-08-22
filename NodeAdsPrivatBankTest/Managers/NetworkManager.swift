//
//  NetworkManager.swift
//  NodeAdsPrivatBankTest
//
//  Created by Andrew Vashulenko on 8/21/19.
//  Copyright © 2019 Andrew Vashulenko. All rights reserved.
//

import Foundation


final class NetworkManager {
  
  func request(city: String, completion: @escaping (Data?, Error?) -> Void) {
    
    let params = prepareParams(city: city)
    let url = createURL(params: params)
    var request = URLRequest(url: url)
    request.httpMethod = "get"
    let task = createDataTask(from: request, completion: completion)
    task.resume()
    print(url)
  }
  
  private func prepareParams(city: String?) -> [String: String] {
    var params = [String: String]()
    params["json"] = ""
    params["atm"] = ""
    params["address"] = ""
    params["city"] = city
    return params
  }
  
  private func createURL(params: [String: String]) -> URL {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "api.privatbank.ua"
    components.path = "/p24api/infrastructure"
    components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
    return components.url!
  }
  
  private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
    return URLSession.shared.dataTask(with: request, completionHandler: { (data, respons, error) in
      DispatchQueue.main.async {
        completion(data, error)
      }
    })
  }
  
}
