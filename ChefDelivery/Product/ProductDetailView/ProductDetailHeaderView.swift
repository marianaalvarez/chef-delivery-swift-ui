//
//  ProductDetailHeaderView.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 19/7/2024.
//

import SwiftUI

struct ProductDetailHeaderView: View {
    let product: ProductType

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(product.image)
                .resizable()
                .scaledToFit()
            Text(product.name)
                .font(.title)
                .bold()
                .padding(.horizontal)
            Text(product.description)
                .padding(.horizontal)
            Text(product.formattedPrice)
                .font(.title3)
                .bold()
                .padding(.horizontal)
        }
    }
}

#Preview {
    ProductDetailHeaderView(product: storesMock[0].products[0])
}
