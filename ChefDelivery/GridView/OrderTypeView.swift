//
//  OrderTypeView.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 2/7/2024.
//

import SwiftUI

struct OrderTypeView: View {
    let orderType: OrderType

    var body: some View {
        VStack(spacing: 5) {
            Image(orderType.image)
                .resizable()
                .scaledToFit()
                .fixedSize(horizontal: false,
                           vertical: true)
            Text(orderType.name)
                .font(.system(size: 10))
        }.frame(width: 70, height: 100)
    }
}

#Preview {
    OrderTypeView(
        orderType: OrderType(
            id: 1,
            name: "Restaurante",
            image: "hamburguer"
        )
    )
}
