//
//  CarouselItemView.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 2/7/2024.
//

import SwiftUI

struct CarouselItemView: View {
    let orderType: OrderType

    var body: some View {
        Image(orderType.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview {
    CarouselItemView(orderType: OrderType(id: 1,
                                          name: "",
                                          image: "barbecue-banner"))
    .previewLayout(.sizeThatFits)
    .padding()
}
