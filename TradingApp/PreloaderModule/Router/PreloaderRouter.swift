//
//  PreloaderRouter.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 20.10.2023.
//

import UIKit

class PreloaderRouter: PreloaderRouterProtocol {
    
    var topView: TopRouterProtocol?
    var tradeView: TradeRouterProtocol?
    var navigationController: UINavigationController?
    var assembler: AssemblerBuilderProtocol
    
    init(navigationController: UINavigationController?,
         assembler: AssemblerBuilderProtocol = Assembler(),
         topView: TopRouterProtocol,
         tradeView: TradeRouterProtocol) {
        self.navigationController = navigationController
        self.assembler = assembler
        self.topView = topView
        self.tradeView = tradeView
    }
//MARK: - initialPreloaderView
    func initialRootView() {
        if let navigationController = navigationController {
            if UserDefaults.standard.bool(forKey: "agreement") == true {
                let mainViewController = assembler.createPreloaderModule(router: self)
                navigationController.viewControllers = [mainViewController]
            } else {
                let tabBar = assembler.createTabBar(router: self)
                guard let top = topView?.initialTopItem() else { return }
                guard let trade = tradeView?.initialTradeItem() else { return }
                tabBar.viewControllers = [trade,
                                          top]
                navigationController.viewControllers = [tabBar]
            }
        }
    }
//MARK: - popToRoot
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
