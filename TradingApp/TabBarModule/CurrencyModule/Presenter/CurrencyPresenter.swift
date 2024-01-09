//
//  CurrencyPresenter.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 20.10.2023.
//

import UIKit

class CurrencyPresenter: CurrencyPresenterProtocol {
    
    var view: CurrencyViewProtocol?
    var interactor: CurrencyInteractorInputProtocol?
    var router: CurrencyRouterProtocol?
    
    func tradeScreen() {
        guard let view = view else { return }
        router?.backToViewController(from: view)
    }

    
    
    
    func getButtonText(string: String?) {
        interactor?.getPresentText(string: string)
    }
    
    func saveSelection(indexPath: IndexPath,
                       cell: UICollectionViewCell) {
        if indexPath.item == UserDefaults.standard.integer(forKey: "saveSelectionCell") {
            cell.backgroundColor = UIColor(named: "green")
        } else {
            cell.backgroundColor = UIColor(named: "dark")
        }
    }
}
extension CurrencyPresenter: CurrencyInteractorOutputProtocol {

}
