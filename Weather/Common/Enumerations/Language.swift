//
//  Language.swift
//  Weather
//
//  Created by Savca Marin on 7/2/19.
//  Copyright © 2019 Savca Marin. All rights reserved.
//

import Foundation

enum Language {
   case en, ro, ru, it, fr
   
   static var all: [Language] {
      return [.en, .ro, .ru, .it, .fr]
   }
   
   var code: String {
      return String(describing: self)
   }
   
   var description: String {
      switch self {
      case .en: return "English"
      case .ro: return "Romanian"
      case .ru: return "Russian"
      case .it: return "Italian"
      case .fr: return "French"
      }
   }
}
