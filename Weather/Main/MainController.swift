//
//  ViewController.swift
//  Weather
//
//  Created by Savca Marin on 7/2/19.
//  Copyright © 2019 Savca Marin. All rights reserved.
//

import UIKit

// Pardon the hardcoded strings used in the project
// Not using them in any world real app

// Also if I did not get the idea of the task right, please let me know

// Just in case if you are checking the app on an iOS 12/13 device
// and gettings constraint errors while the action sheet is being presented
// it is a bug from apple
// https://stackoverflow.com/questions/55372093/uialertcontrollers-actionsheet-gives-constraint-error-on-ios-12-2-12-3

class MainController: UIViewController {
   
   @IBOutlet weak private var tableView: UITableView!
   
   private var presenter: MainPresenter!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      presenter = MainPresenter(self)
      setupTableView()
      fetchAllData()
   }
   
   private func fetchAllData() {
      cleanTable()
      presenter.fetchAllData { [weak self] (forecasts) in
         forecasts.forEach { forecast in
            self?.insertRow(forecast: forecast)
         }
      }
   }
   
   
   @IBAction private func selectUnits(_ sender: UIBarButtonItem) {
      presenter.selectUnits {
         self.fetchAllData()
      }
   }
   
   @IBAction func selectLanguage(_ sender: UIBarButtonItem) {
      presenter.selectLanguage {
         self.fetchAllData()
      }
   }
   
}

extension MainController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return presenter.numberOfRows
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(with: ForecastCell.self, for: indexPath)
      cell.setupCell(presenter.forecastList[indexPath.row])
      return cell
   }
   
   private func setupTableView() {
      tableView.register(cellType: ForecastCell.self)
      tableView.rowHeight = 60
      tableView.tableFooterView = UIView()
   }
   
   private func reloadTable() {
      DispatchQueue.main.async {
         self.tableView.reloadData()
      }
   }
   
   private func cleanTable() {
      presenter.forecastList.removeAll()
      presenter.numberOfRows = 0
      reloadTable()
   }
   
   func insertRow(forecast: Forecast) {
      presenter.forecastList.append(forecast)
      let index = IndexPath(row: presenter.forecastList.count - 1, section: 0)
      DispatchQueue.main.async {
         self.presenter.numberOfRows += 1
         self.tableView.insertRows(at: [index], with: .automatic)
      }
   }
}
