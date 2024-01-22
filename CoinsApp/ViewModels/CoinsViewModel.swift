//
//  CoinsViewModel.swift
//  CoinsApp
//
//  Created by almayo ibrahim  on 22/01/2024.
//

import Foundation
import SwiftUI

class CoinsViewModel: ObservableObject {
    
    @Published var coin = ""
    @Published var price = ""
    
    init() {
        fetchPrice()
    }
    
    func fetchPrice() {
        self.coin = "Bitcoin"
        self.price = "$30,000"
        
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            print("Did receive data \(data)")
            guard let data = data else { return }
            guard let jasonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
            
            let value = jasonObject["bitcoin"] as? [String: Any]
            
            print(value)
            
        }.resume()
    }
}
