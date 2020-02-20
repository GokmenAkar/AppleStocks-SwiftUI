//
//  StockViewModel.swift
//  AppleStocks-SwiftUI
//
//  Created by Developer on 20.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

struct StockViewModel {
    let stock: Stock
    
    var symbol: String {
        return stock.symbol.uppercased()
    }
    
    var description: String {
        return stock.description
    }
    
    var price: String {
        return String(format: "%.2f", stock.price)
    }
    
    var change: String {
        return stock.change
    }
}
