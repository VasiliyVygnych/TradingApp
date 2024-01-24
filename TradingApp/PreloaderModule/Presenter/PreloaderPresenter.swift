//
//  PreloaderPresenter.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 20.10.2023.
//

import UIKit

class PreloaderPresenter: PreloaderPresenterProtocol {
    var view: PreloaderViewProtocol?
    var interactor: PreloaderInteractorInputProtocol?
    var router: PreloaderRouterProtocol?
    let defaults = UserDefaults.standard
    var agreement = Bool()
    
//MARK: - permissionForNotification
    func permissionForNotification() -> UIAlertController {
        let alert = UIAlertController(title: "“App” would like to Send You Notifications",
                                      message: "Notifications may include alerts, sounds and icon badges. These can be configured in Settings.",
                                      preferredStyle: .alert)
        let dontAllow = UIAlertAction(title: "Don’t Allow",
                                         style: .default) { (action) in
            self.agreement = false
            self.defaults.set(self.agreement, forKey: "agreement")
            self.router?.initialRootView()
        }
        let allow = UIAlertAction(title: "Allow",
                                    style: .default) { (action) in
            self.agreement = false
            self.defaults.set(self.agreement, forKey: "agreement")
            self.router?.initialRootView()
      }
        alert.addAction(dontAllow)
        alert.addAction(allow)
        return alert
    }
}
extension PreloaderPresenter: PreloaderInteractorOutputProtocol {}
