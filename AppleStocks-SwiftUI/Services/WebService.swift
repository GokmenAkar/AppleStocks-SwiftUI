//
//  WebService.swift
//  AppleStocks-SwiftUI
//
//  Created by Developer on 20.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class WebService {
    
    func getStocks(completation: @escaping ([Stock]?) -> Void) {
        guard let url = URL(string: "https://poised-echinacea-q201xlcpzr.glitch.me/stocks") else {
            fatalError("URL is no correct")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completation(nil)
                return
            }
            
            let stocks = try! JSONDecoder().decode([Stock].self, from: data)
            
            completation(stocks)
        }.resume()
    }
    
    func getTopNews(completation: @escaping ([Stock]?) -> Void) {
        guard let url = URL(string: "https://poised-echinacea-q201xlcpzr.glitch.me/top-news") else {
            fatalError("URL is no correct")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completation(nil)
                return
            }
            
            let stocks = try! JSONDecoder().decode([Stock].self, from: data)
            
            completation(stocks)
        }.resume()
    }
    
}
