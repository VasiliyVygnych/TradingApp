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

var newView: [UIView] = []

var modelTrade = [Items(image: UIImage(named: "united-states")!, name: "Oliver", deposit: 600, profit: 1699),
             Items(image: UIImage(named: "canada")!, name: "Mishael", deposit: 500, profit: 2577),
             Items(image: UIImage(named: "brazil")!, name: "Alex", deposit: 800, profit: 1222),
             Items(image: UIImage(named: "south-korea")!, name: "Kim Sun", deposit: 300, profit: 1500),
             Items(image: UIImage(named: "germany")!, name: "Vasiliy", deposit: 100, profit: 300),
             Items(image: UIImage(named: "brazil")!, name: "Max", deposit: 50, profit: 130),
             Items(image: UIImage(named: "france")!, name: "Sergey", deposit: 1000, profit: 530),
             Items(image: UIImage(named: "new-zealand")!, name: "Maryana", deposit: 450, profit: 999),
             Items(image: UIImage(named: "india")!, name: "Tomas", deposit: 666, profit: 340),
             Items(image: UIImage(named: "spain")!, name: "John", deposit: 596, profit: 800)]

var currencyPair = [Currency(currencyPair: "EUR / USD"),
                    Currency(currencyPair: "GPB / USD"),
                    Currency(currencyPair: "EUR / USD"),
                    Currency(currencyPair: "EUR / USD"),
                    Currency(currencyPair: "GPB / USD"),
                    Currency(currencyPair: "EUR / USD"),
                    Currency(currencyPair: "GPB / USD"),
                    Currency(currencyPair: "USD / USD"),
                    Currency(currencyPair: "EUR / EUR"),
                    Currency(currencyPair: "EUR / USD")]

var myFinances = MyFinances(balance: 10000,
                            investment: 0.0)
