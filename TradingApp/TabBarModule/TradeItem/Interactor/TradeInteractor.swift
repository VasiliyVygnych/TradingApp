//
//  TradeInteractor.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 18.10.2023.
//

import UIKit

class TradeInteractor: TradeInteractorInputProtocol {
    
    var presenter: TradeInteractorOutputProtocol?
    var network: NetworkProtocol?
    
//MARK: - taskRequest
    func taskRequest() {
        guard let value = UserDefaults.standard.string(forKey: "buttonText") else { return }
        network?.request(value: value, completion: { [ weak self ] request in
            DispatchQueue.main.async {
                self?.presenter?.getRequest(request: request)
                self?.presenter?.textButton(text: value)
            }
        })
    }
//MARK: - getDataPresenter
    func getDataPresenter() {
        presenter?.setDataView()
    }
//MARK: - purchase methods
    func purchase(value: Double) {
        network?.purchaseInvestments(value: value)
    }
}
