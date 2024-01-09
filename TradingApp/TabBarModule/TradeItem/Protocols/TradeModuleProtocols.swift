//
//  TradeModuleProtocols.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 18.10.2023.
//

import UIKit

protocol TradeViewProtocol {
    var presenter: TradePresenterProtocol? { get set }
    
    func setData()
    func setTextButton(text: String)
    
    func setRequest(request: URLRequest)
}

protocol TradePresenterProtocol {
    var view: TradeViewProtocol? { get set }
    var interactor: TradeInteractorInputProtocol? { get set }
    var router: TradeRouterProtocol? { get set }
    var updateView: (() -> Void)? { get set }
    
    func currencyScreen()
    func viewDidLoad()
    func request()
    
    func clickAnimation(button: UIButton)
    func statusNotification(option: Int)
    func checkingPurchase()
    
    func openKeyboard()
    func closeKeyboard()
    
    func keyboardNumber(number: Int)
}

protocol TradeInteractorInputProtocol {
    var presenter: TradeInteractorOutputProtocol? { get set }
    var network: NetworkProtocol? { get set }

    func getDataPresenter()
    func taskRequest()
    func purchase(value: Double)
}

protocol TradeInteractorOutputProtocol {
    
    func setDataView()
    func textButton(text: String)
    func getRequest(request: URLRequest)
    
}

protocol TradeRouterProtocol {
    func presentToCurrencyScreen(from view: TradeViewProtocol)
    func initialTradeItem() -> UIViewController
}
