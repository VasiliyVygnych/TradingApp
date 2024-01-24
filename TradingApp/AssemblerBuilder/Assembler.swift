//
//  Assembler.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 24.10.2023.
//

import UIKit

class Assembler: AssemblerBuilderProtocol {
   
//MARK: - createMainModule
    func createPreloaderModule(router: PreloaderRouterProtocol) -> UIViewController {
        let viewController = PreloaderViewController()
        var presenter: PreloaderPresenterProtocol & PreloaderInteractorOutputProtocol = PreloaderPresenter()
        var interactor: PreloaderInteractorInputProtocol = PreloaderInteractor()
        let router = router
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        return viewController
    }
//MARK: - createTabBar
    func createTabBar(router: PreloaderRouterProtocol) -> UITabBarController {
        let tabBar = UITabBarController()
        tabBar.modalPresentationStyle = .fullScreen
        tabBar.tabBar.tintColor = UIColor(named: "green")
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "theme")
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        return tabBar
    }
//MARK: - createTopItem
    func createTopItem(router: TopRouterProtocol) -> UIViewController {
        let viewController = ViewTopController()
        let navigation = UINavigationController(rootViewController: viewController)
        var presenter: TopPresenterProtocol & TopInteractorOutputProtocol = TopPresenter()
        var interactor: TopInteractorInputProtocol = TopInteractor()
        let router = router
        let network: NetworkProtocol = Network()
        viewController.presenter = presenter
        presenter.view = viewController as? any TopViewProtocol
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.network = network
        return navigation
    }
//MARK: - createTradeItem
    func createTradeItem(router: TradeRouterProtocol) -> UIViewController {
        let viewController = TradeViewController()
        let navigation = UINavigationController(rootViewController: viewController)
        var presenter: TradePresenterProtocol & TradeInteractorOutputProtocol = TradePresenter()
        var interactor: TradeInteractorInputProtocol = TradeInteractor()
        let router = router
        let network: NetworkProtocol = Network()
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.network = network
        return navigation
    }
//MARK: - makeCurrencyView
    func makeCurrencyView() -> UIViewController {
        let viewController = CurrencyViewController()
        var presenter: CurrencyPresenterProtocol & CurrencyInteractorOutputProtocol = CurrencyPresenter()
        var interactor: CurrencyInteractorInputProtocol = CurrencyInteractor()
        let router = CurrencyRouter()
        let network: NetworkProtocol = Network()
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.network = network
        return viewController
    }
}
