//
//  TradeRouter.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 18.10.2023.
//

import UIKit

class TradeRouter: TradeRouterProtocol {
    
    var navigationController: UINavigationController?
    var tabBarController: UITabBarController?
    var assembler: AssemblerBuilderProtocol
    
    init(navigationController: UINavigationController,
         assembler: AssemblerBuilderProtocol = Assembler(),
         tabBarController: UITabBarController?) {
        
        self.tabBarController = tabBarController
        self.navigationController = navigationController
        self.assembler = assembler
    }
//MARK: - initialTradeItem
    func initialTradeItem() -> UIViewController {
        let mainViewController = assembler.createTradeItem(router: self)
        mainViewController.tabBarItem = UITabBarItem(title: "Trade",
                                                     image: UIImage(named: "trade"),
                                                     tag: 0)
        return mainViewController
    }
//MARK: - presentToCurrencyScreen
    func presentToCurrencyScreen(from view: TradeViewProtocol) {
        let currencyVC = assembler.makeCurrencyView()
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid View Protocol type")
        }
        viewVC.navigationController?.pushViewController(currencyVC,
                                                        animated: true)
    }
}
