//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 1/7/2024.
//

import SwiftUI

struct ContentView: View {
    
    private var service = HomeService()
    
    // MARK: - View
    
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
            service.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
