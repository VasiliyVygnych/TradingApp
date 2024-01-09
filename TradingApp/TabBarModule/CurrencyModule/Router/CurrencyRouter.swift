//
//  CurrencyRouter.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 18.10.2023.
//

import UIKit

class CurrencyRouter: CurrencyRouterProtocol {
    
    func backToViewController(from view: CurrencyViewProtocol) {
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid view protocol type")
        }
        viewVC.navigationController?.popViewController(animated: true)
    }
}
