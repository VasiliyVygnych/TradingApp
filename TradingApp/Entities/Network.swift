//
//  Network.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 18.10.2023.
//

import UIKit

class Network: NetworkProtocol {
  
//MARK: - request
    func request(value: String,
                   completion: @escaping (URLRequest) -> Void) {
        var components = URLComponents(string: "https://www.tradingview.com/chart/?")
        components?.queryItems = [URLQueryItem(name: "symbol",
                                               value: value)]
        guard let url = components?.url else { return }
            let request = URLRequest(url: url)
            completion(request)
    }
//MARK: - purchaseInvestments
    func purchaseInvestments(value: Double) {
        print("layer network, investments = \(value)")
        
        
        
    }
}
