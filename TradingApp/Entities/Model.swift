//
//  Model.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 20.10.2023.
//

import UIKit

struct TradeData {
    let items: [Items]
    let balance: MyFinances
    let currency: [Currency]
}

struct Currency {
    var currencyPair: String
}

struct Items {
    var image: UIImage
    var name: String
    var deposit: Int
    var profit: Int
}

struct MyFinances {
    var balance: Double
    var investment: Double
}
