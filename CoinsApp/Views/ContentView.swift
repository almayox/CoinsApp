//
//  ContentView.swift
//  CoinsApp
//
//  Created by almayo ibrahim  on 22/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = CoinsViewModel()
    
    var body: some View {
        
        if let errorMessage = viewModel.errorMessage {
            Text(errorMessage)
        } else {
            Text("\(viewModel.coin): \(viewModel.price)")
        }
    }
}

#Preview {
    ContentView()
}
