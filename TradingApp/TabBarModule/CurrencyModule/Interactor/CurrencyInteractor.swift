//
//  CurrencyInteractor.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 20.10.2023.
//

import UIKit

class CurrencyInteractor: CurrencyInteractorInputProtocol {
    
    var presenter: CurrencyInteractorOutputProtocol?
    var network: NetworkProtocol?
    
    func getPresentText(string: String?) {
        UserDefaults.standard.set(string,
                                  forKey: "buttonText")
    }
}
