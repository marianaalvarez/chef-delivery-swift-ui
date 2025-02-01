//
//  ProductDetailQuantityView.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 19/7/2024.
//

import SwiftUI

struct ProductDetailQuantityView: View {
    @Binding var productQuantity: Int
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Quantidade")
                .font(.title3)
                .bold()
            HStack {
                Button {
                    if productQuantity > 0 {
                        productQuantity -= 1
                    }
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.title)
                        .bold()
                }
                Text("\(productQuantity)")
                    .font(.title2)
                    .bold()
                Button {
                    productQuantity += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    ProductDetailQuantityView(productQuantity: .constant(1))
}
