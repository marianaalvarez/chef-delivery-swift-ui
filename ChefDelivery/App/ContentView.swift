//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 1/7/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isLoading = true
    @State private var storesType: [StoreType] = []
    private var service = HomeService()
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView()
                } else {
                    NavigationBar()
                        .padding(.horizontal, 15)
                        .padding(.top, 15)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            OrderTypeGridView()
                            CarouselTabView()
                            StoresContainerView(stores: storesType)
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                await getStores()
            }
        }
    }
    
    func getStores() async {
        do {
            let result = try await service.fetchData()
            switch result {
            case .success(let stores):
                storesType = stores
            case .failure(let error):
                print(error.localizedDescription)
            }
            isLoading = false
        } catch {
            print(error.localizedDescription)
            isLoading = false
        }
    }
}

#Preview {
    ContentView()
}
