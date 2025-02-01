//
//  OrderTypeGridView.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 1/7/2024.
//

import SwiftUI

struct OrderTypeGridView: View {
    var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(),
                                         spacing: 10),
                     count: 2)
    }
    
    var body: some View {
        LazyHGrid(rows: gridLayout) {
            ForEach(ordersMock) { orderType in
                OrderTypeView(orderType: orderType)
            }
        }
        .frame(height: 200)
        .padding(.horizontal, 14)
        .padding(.top, 15)
    }
}

#Preview {
    OrderTypeGridView()
}
