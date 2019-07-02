//
//  Location.swift
//  Weather
//
//  Created by Savca Marin on 7/2/19.
//  Copyright © 2019 Savca Marin. All rights reserved.
//

import Foundation

enum Location {
   case london, adelaide, melbourne, sydney, brisbane, perth, paris, newYork, toronto, moscow
   
   static var all: [Location] {
      return [.london, .adelaide, .melbourne, .sydney, .brisbane, .perth, .paris, .newYork, .toronto, .moscow]
   }
   
   var description: String {
      switch self {
      case .london:     return "London,uk"
      case .adelaide:   return "Adelaide,au"
      case .melbourne:  return "Melbourne,au"
      case .sydney:     return "Sydney,au"
      case .brisbane:   return "Brisbane,au"
      case .perth:      return "Perth,au"
      case .paris:      return "Paris,fr"
      case .newYork:    return "NewYork,us"
      case .toronto:    return "Toronto,ca"
      case .moscow:     return "Moscow,ru"
      }
   }
}
