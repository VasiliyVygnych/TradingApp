//
//  TradePresenter.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 18.10.2023.
//

import UIKit

class TradePresenter: TradePresenterProtocol {
    
    var view: TradeViewProtocol?
    var interactor: TradeInteractorInputProtocol?
    var router: TradeRouterProtocol?
    var updateView: (() -> Void)?
    
//MARK: - method open currencyScreen
    func currencyScreen() {
        guard let view = view else { return }
        router?.presentToCurrencyScreen(from: view)
    }
//MARK: - viewDidLoad
    func viewDidLoad() {
        interactor?.getDataPresenter()
    }
//MARK: - request
    func request() {
        interactor?.taskRequest()
    }
//MARK: - method clickAnimation
    func clickAnimation(button: UIButton) {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
            button.transform = CGAffineTransform(scaleX: 0.70,
                                                 y: 0.70)
            button.backgroundColor = .lightGray
            }, completion: nil)
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
            button.transform = CGAffineTransform(scaleX: 1,
                                                 y: 1)
            button.backgroundColor = .gray
        }, completion: nil)
    }
//MARK: - method openKeyboard
    func openKeyboard() {
        newView.forEach { buttom in
            buttom.isHidden = false
            buttom.layoutIfNeeded()
        }
    }
//MARK: - mhetod closeKeyboard
    func closeKeyboard() {
        newView.forEach { buttom in
            buttom.isHidden = true
            buttom.layoutIfNeeded()
        }
    }
    
    
    func keyboardNumber(number: Int) {
        print("keyboard number = \(number)")
    }
    
    
    
//MARK: - statusNotification
    func statusNotification(option: Int) {
        let view = view as! UIViewController
        switch option {
        case 1: if option == 1 {
            let alert = UIAlertController(title: "Платеж выполнен!",
                                          message: "",
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: "Ок",
                                       style: .default) { (action) in }
            alert.addAction(action)
            view.present(alert,
                         animated: true)
        }
        case 2: if option == 2 {
            let alert = UIAlertController(title: "Платеж не выполнен!",
                                          message: "Отсуствует соединение с интернетом.",
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: "Ок",
                                       style: .default) { (action) in }
            alert.addAction(action)
            view.present(alert,
                         animated: true)
        }
        case 3: if option == 3 {
            let alert = UIAlertController(title: "Платеж не выполнен!",
                                          message: "Не хватает средств на Вашем балансе.",
                                          preferredStyle: .alert)
            let balance = UIAlertAction(title: "Пополнить баланс",
                                        style: .cancel) { (action) in
                print("Пополнить баланс.")
            }
            let later = UIAlertAction(title: "Позже",
                                       style: .default) { (action) in }
            alert.addAction(balance)
            alert.addAction(later)
            view.present(alert,
                         animated: true)
        }
        case 4: if option == 4 {
            let alert = UIAlertController(title: "Платеж не выполнен!",
                                          message: "Некорректная сумма",
                                          preferredStyle: .alert)
            let later = UIAlertAction(title: "ок",
                                       style: .default) { (action) in }
            alert.addAction(later)
            view.present(alert,
                         animated: true)
        }
        default:
            break
        }
    }
//MARK: - checkingPurchase
    func checkingPurchase() {
        if myFinances.investment == 0  {
            self.statusNotification(option: 4)
        }
        if myFinances.balance < Double(myFinances.investment) {
            self.statusNotification(option: 3)
        }
        if myFinances.balance == 10000000000 { //* заменить на проверку подключения к сети интернет
            self.statusNotification(option: 2)
        } else {
             self.statusNotification(option: 1)
            self.purchase()
        }
    }
//MARK: - purchase
    func purchase() {
        interactor?.purchase(value: myFinances.investment)
        myFinances.balance = (myFinances.balance - myFinances.investment)
    
        updateView?()
    }
}
extension TradePresenter: TradeInteractorOutputProtocol {
    func setDataView() {
        view?.setData()
    }
    func textButton(text: String) {
        view?.setTextButton(text: text)
    }
    func getRequest(request: URLRequest) {
        view?.setRequest(request: request)
    }
}
