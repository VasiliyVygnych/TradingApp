//
//  TopRouter.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 18.10.2023.
//

import UIKit

class TopRouter: TopRouterProtocol {
    
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
    
    func initialTopItem() -> UIViewController {
        let mainViewController = assembler.createTopItem(router: self)
        mainViewController.tabBarItem = UITabBarItem(title: "Top",
                                                     image: UIImage(named: "user"),
                                                     tag: 1)
        return mainViewController
    }
}
