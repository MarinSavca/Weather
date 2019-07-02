//
//  Error.swift
//  Weather
//
//  Created by Savca Marin on 7/2/19.
//  Copyright © 2019 Savca Marin. All rights reserved.
//

import Foundation

// In a real world app we would cover obviously a lot more cases
enum CustomError: Error {
   case noNetwork, unknown
}
