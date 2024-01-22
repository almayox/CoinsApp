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
        
        Text("\(viewModel.coin): \(viewModel.price)")
    }
}

#Preview {
    ContentView()
}
