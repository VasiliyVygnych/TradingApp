//
//  ProtocolsTopModule.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 18.10.2023.
//

import UIKit

protocol TopViewProtocol {
    var presenter: TopPresenterProtocol? { get set }
    
}

protocol TopPresenterProtocol {
    var view: TopViewProtocol? { get set }
    var interactor: TopInteractorInputProtocol? { get set }
    var router: TopRouterProtocol? { get set }
    
}

protocol TopInteractorInputProtocol {
    var presenter: TopInteractorOutputProtocol? { get set }
    var network: NetworkProtocol? { get set }
}

protocol TopInteractorOutputProtocol {
    
}

protocol TopRouterProtocol {
    func initialTopItem() -> UIViewController
    
}

protocol NetworkProtocol {
    func request(value: String,
                   completion: @escaping (URLRequest) -> Void)
    func purchaseInvestments(value: Double)
}
