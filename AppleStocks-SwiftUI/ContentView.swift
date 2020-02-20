//
//  ContentView.swift
//  AppleStocks-SwiftUI
//
//  Created by Developer on 20.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @ObservedObject var stockListViewModel = StockListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
        
        stockListViewModel.loadData()
    }
    
    var body: some View {
        
        let filteredStock = self.stockListViewModel.searchTerm.isEmpty ? self.stockListViewModel.stocks : self.stockListViewModel.stocks.filter { $0.symbol.starts(with: self.stockListViewModel.searchTerm) }
        
        return NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                
                Text("20 February 2020")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -390)
                
                SearchView(searchTerm: $stockListViewModel.searchTerm)
                    .offset(y: -340)
                
                StockListView(stocks: filteredStock)
                    .offset(y: 150)
            }
            .navigationBarTitle(Text("Stocks").foregroundColor(Color.white)
            )
        }
        .edgesIgnoringSafeArea(Edge.Set(.bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
