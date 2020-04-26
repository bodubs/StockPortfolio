//
//  Stock.swift
//  StockPortforlio
//
//  Created by Bo Warren on 4/16/20.
//  Copyright © 2020 rpwarren. All rights reserved.
//

import Foundation


class Stock: Codable {
    var name: String
    var bookPrice: Double
    var marketPrice: Double
    var yield: Double
    var exchange: String
    var symbol: String
    
    init(name: String, bookPrice: String, marketPrice: String, exchange: String, symbol: String) {
        var bookToDouble = Double(bookPrice)!
        var marketToDouble = Double(marketPrice)!
        self.name = name
        self.bookPrice = bookToDouble
        self.marketPrice = marketToDouble
        self.yield = round(((marketToDouble / bookToDouble) - 1) * 100 * 100) / 100
        self.exchange = exchange
        self.symbol = symbol
    }
    
}
