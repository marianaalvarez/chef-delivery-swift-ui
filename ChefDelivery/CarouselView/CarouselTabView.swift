//
//  CarouselTabView.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 2/7/2024.
//

import SwiftUI

struct CarouselTabView: View {
    @State private var currentIndex = 1
    let orderMocks: [OrderType] = [
        OrderType(id: 1, name: "barbecue-banner", image: "barbecue-banner"),
        OrderType(id: 2, name: "brazilian-meal-banner", image: "brazilian-meal-banner"),
        OrderType(id: 3, name: "pokes-banner", image: "pokes-banner")
    ]
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(orderMocks) { mock in
                CarouselItemView(orderType: mock)
                    .tag(mock.id)
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .always))
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
                if currentIndex > orderMocks.count {
                    currentIndex = 1
                }
                currentIndex += 1
            }
        }
    }
}

#Preview {
    CarouselTabView()
}
