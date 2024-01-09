//
//  CurrencyModuleProtocols.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 18.10.2023.
//

import UIKit

protocol CurrencyViewProtocol {
    var presenter: CurrencyPresenterProtocol? { get set }
    
}

protocol CurrencyPresenterProtocol {
    var view: CurrencyViewProtocol? { get set }
    var interactor: CurrencyInteractorInputProtocol? { get set }
    var router: CurrencyRouterProtocol? { get set }
    
    func tradeScreen()
    func getButtonText(string: String?)
    func saveSelection(indexPath: IndexPath, cell: UICollectionViewCell)
}

protocol CurrencyInteractorInputProtocol {
    var presenter: CurrencyInteractorOutputProtocol? { get set }
    var network: NetworkProtocol? { get set }
    
    func getPresentText(string: String?)
}

protocol CurrencyInteractorOutputProtocol {
    
}

protocol CurrencyRouterProtocol {
    func backToViewController(from view: CurrencyViewProtocol)
}
