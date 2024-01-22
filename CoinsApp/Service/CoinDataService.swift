//
//  CoinDataService.swift
//  CoinsApp
//
//  Created by almayo ibrahim  on 22/01/2024.
//

import Foundation
import SwiftUI

class CoinDataService {
    
    func fetchPrice(coin: String, completion: @escaping(Double) -> Void) {
        
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Debug: Faild with error \(error.localizedDescription)")
//                self.errorMessage = error.localizedDescription
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
//                self.errorMessage = "Bad HTTP response"
                return
            }
            
            guard httpResponse.statusCode == 200 else {
//                self.errorMessage = "Faild to fetch with status code \(httpResponse.statusCode)"
                return
            }
            
            print("Debug: Response status code is: \(httpResponse.statusCode)")

            guard let data = data else { return }
            
            guard let jasonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
            
            guard let value = jasonObject[coin] as? [String: Double] else {
                print("Faild to parse value")
                return
            }
            guard let price = value["usd"] else { return }
            
            completion(price)
            
        }.resume()
    }
    
}
