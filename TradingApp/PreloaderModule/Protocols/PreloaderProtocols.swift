//
//  PreloaderProtocols.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 20.10.2023.
//

import UIKit

protocol PreloaderViewProtocol {
    var presenter: PreloaderPresenterProtocol? { get set }
    
}

protocol PreloaderPresenterProtocol {
    var view: PreloaderViewProtocol? { get set }
    var interactor: PreloaderInteractorInputProtocol? { get set }
    var router: PreloaderRouterProtocol? { get set }

    func permissionForNotification() -> UIAlertController
}

protocol PreloaderInteractorInputProtocol {
    var presenter: PreloaderInteractorOutputProtocol? { get set }

}

protocol PreloaderInteractorOutputProtocol {
    
}

protocol AssemblerBuilderProtocol {
    func createPreloaderModule(router: PreloaderRouterProtocol) -> UIViewController
    func createTabBar(router: PreloaderRouterProtocol) -> UITabBarController
    func createTopItem(router: TopRouterProtocol) -> UIViewController
    func createTradeItem(router: TradeRouterProtocol) -> UIViewController
    func makeCurrencyView() -> UIViewController
}

protocol PreloaderRouterProtocol {
    func initialRootView()
}
