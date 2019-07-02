//
//  XibExtension.swift
//  Weather
//
//  Created by Savca Marin on 7/2/19.
//  Copyright © 2019 Savca Marin. All rights reserved.
//

import UIKit

public extension UITableView {
   func register<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
      let className = String(describing: T.self)
      let nib = UINib(nibName: className, bundle: bundle)
      register(nib, forCellReuseIdentifier: className)
   }
   
   func register<T: UITableViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil) {
      cellTypes.forEach { register(cellType: $0, bundle: bundle) }
   }
   
   func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
      return self.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as! T
   }
}
