//
//  ForecastIterator.swift
//  Weather
//
//  Created by Savca Marin on 7/2/19.
//  Copyright © 2019 Savca Marin. All rights reserved.
//

import Foundation

typealias APIResult = Result<[Forecast], CustomError>

class ForecastInteractor {
   
   private let appid = "f0f99672f5a288beb64d77d1c582cc87"
   
   
   func fetchData(unit: Unit = .celsius, language: Language = .en, location: Location, completion: @escaping (APIResult) -> Void) {
      guard Reachability.isConnectedToNetwork else {
         completion(.failure(.noNetwork))
         return
      }
      guard let url = createUrl(unit: unit, language: language, location: location) else {
         completion(.failure(.unknown))
         return
      }
      
      URLSession.shared.dataTask(with: url) { data, response, error in
         guard error == nil, let data = data else {
            completion(.failure(.unknown))
            return
         }
         
         if let forecast = try? JSONDecoder().decode(Forecast.self, from: data) {
            completion(.success([forecast]))
         } else if let forecast = try? JSONDecoder().decode([Forecast].self, from: data) {
            completion(.success(forecast))
         }
      }.resume()
   }
   
   func fetchAll(unit: Unit = .celsius, language: Language = .en, completion: @escaping (APIResult) -> Void) {
      Location.all.forEach { location in
         fetchData(unit: unit, language: language, location: location) { forecast in
            completion(forecast)
         }
      }
   }
   
   private func createUrl(unit: Unit = .celsius, language: Language = .en, location: Location) -> URL? {
      guard var urlComponents = URLComponents(string: "http://api.openweathermap.org/data/2.5/weather") else { return nil }
      let queryItems = [
         URLQueryItem(name: "q", value: location.description),
         URLQueryItem(name: "APPID", value: appid),
         URLQueryItem(name: "units", value: unit.type),
         URLQueryItem(name: "lang", value: language.code)
      ]
      urlComponents.queryItems = queryItems
      return urlComponents.url
   }
   
}
