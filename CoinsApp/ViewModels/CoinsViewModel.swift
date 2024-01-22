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
    @Published var errorMessage: String?
    
    private let service = CoinDataService()
    
    init() {
        fetchPrice(coin: "bitcoin")
    }
    
    func fetchPrice(coin: String) {
        service.fetchPrice(coin: coin) { priceFromService in
            print("Debug: Price from service is \(priceFromService)")
            
            DispatchQueue.main.async {
                self.coin = coin.capitalized
                self.price = "$\(priceFromService)"
            }
        }
    }
}
