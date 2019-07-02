//
//  Unit.swift
//  Weather
//
//  Created by Savca Marin on 7/2/19.
//  Copyright © 2019 Savca Marin. All rights reserved.
//

import Foundation

enum Unit {
   case celsius, fahrenheit, kelvin
   
   static var all: [Unit] {
      return [.celsius, .fahrenheit, .kelvin]
   }
   
   var description: String {
      switch self {
      case .celsius:    return "celsius"
      case .fahrenheit: return "fahrenheit"
      case .kelvin:     return "kelvin"
      }
   }
   
   var type: String {
      switch self {
      case .celsius:    return "metric"
      case .fahrenheit: return "imperial"
      case .kelvin:     return ""
      }
   }
}
