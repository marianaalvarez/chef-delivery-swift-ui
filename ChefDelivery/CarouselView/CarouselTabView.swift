//
//  CarouselTabView.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 2/7/2024.
//

import SwiftUI

struct CarouselTabView: View {
    let orderMocks: [OrderType] = [
        OrderType(id: 1, name: "barbecue-banner", image: "barbecue-banner"),
        OrderType(id: 2, name: "brazilian-meal-banner", image: "brazilian-meal-banner"),
        OrderType(id: 3, name: "pokes-banner", image: "pokes-banner")
    ]
    var body: some View {
        TabView {
            ForEach(orderMocks) { mock in
                CarouselItemView(orderType: mock)
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    CarouselTabView()
}
