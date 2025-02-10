//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 1/7/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationBar()
                    .padding(.horizontal, 15)
                    .padding(.top, 15)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        OrderTypeGridView()
                        CarouselTabView()
                        StoresContainerView()
                    }
                }
            }
        }
        .onAppear {
            fetchData()
        }
    }
    
    // MARK: Methods
    
    func fetchData() {
        guard let url = URL(string: "https://private-a0bdaf-chefdelivery24.apiary-mock.com/questions") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                print(data)
            }
        }.resume()
    }
}

#Preview {
    ContentView()
}
