//
//  TopPresenter.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 18.10.2023.
//

import UIKit

class TopPresenter: TopPresenterProtocol {
    
    var view: TopViewProtocol?
    var interactor: TopInteractorInputProtocol?
    var router: TopRouterProtocol?
    
}

extension TopPresenter: TopInteractorOutputProtocol {
    
}
