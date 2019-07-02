//
//  MainPresenter.swift
//  Weather
//
//  Created by Savca Marin on 7/2/19.
//  Copyright © 2019 Savca Marin. All rights reserved.
//

import UIKit

class MainPresenter {
   
   
   // MARK: - Parameters
   
   // if the app would be bigged I guess this would be saved in some shared preferences
   // I hope I got the idea of the task right
   private var unit: Unit = .celsius
   private var language: Language = .en
   
   private let forecastInteractor = ForecastInteractor()
   var forecastList: [Forecast] = []
   var numberOfRows = 0
   
   let vc: UIViewController!
   
   
   // MARK: - Lifecycle
   
   init(_ vc: UIViewController) {
      self.vc = vc
   }
   
   
   // MARK: - Language & Unit Selection
   
   // could be done in a more generic way, but we'll keep it simple for better readability
   func selectLanguage(completion: @escaping () -> Void) {
      let alert = UIAlertController(title: "Language", message: "Please select the language", preferredStyle: .actionSheet)
      Language.all.forEach { language in
         alert.addAction(UIAlertAction(title: language.description.capitalized, style: .default) { _ in
            self.language = language
            completion()
         })
      }
      alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
      vc.present(alert, animated: true, completion: nil)
   }
   
   func selectUnits(completion: @escaping () -> Void) {
      let alert = UIAlertController(title: "Units", message: "Please select the temperature units", preferredStyle: .actionSheet)
      Unit.all.forEach { unit in
         alert.addAction(UIAlertAction(title: unit.description.capitalized, style: .default) { _ in
            self.unit = unit
            completion()
         })
      }
      alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
      vc.present(alert, animated: true, completion: nil)
   }
   
   
   // MARK: - Data fetch
   
   func fetchAllData(completion: @escaping ([Forecast]) -> Void ) {
      forecastInteractor.fetchAll(unit: unit, language: language) { [weak self] result in
         switch result {
         case .success(let forecasts):
            completion(forecasts)
         case .failure(let error):
            self?.handleError(error)
         }
      }
   }
   
   
   // MARK: - Error Handling
   
   func handleError(_ error: CustomError) {
      switch error {
      case .unknown:
         showAlert(title: "Something went wrong")
      case .noNetwork:
         showAlert(title: "Internet connection", message: "Please make sure you are connected to internet" )
      }
   }
   
   private func showAlert(title: String, message: String = "") {
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default))
      vc.present(alert, animated: true)
   }
   
}
