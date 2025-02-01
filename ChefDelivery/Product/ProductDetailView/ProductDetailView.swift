//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 5/7/2024.
//

import SwiftUI

struct ProductDetailView: View {
    @State var productQuantity: Int = 1
    let product: ProductType
    
    var body: some View {
        VStack {
            ProductDetailHeaderView(product: product)
            Spacer()
            ProductDetailQuantityView(productQuantity: $productQuantity)
            Text("\(productQuantity)")
            Spacer()
            CartButtonView()
        }
    }
}

#Preview {
    ProductDetailView(productQuantity: 1,
                      product: storesMock[0].products[0])
}

struct CartButtonView: View {
    var body: some View {
        Button {
            print("Button pressed")
        } label: {
            HStack {
                Image(systemName: "cart")
                Text("Adicionar ao carrinho")
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .font(.title3)
            .bold()
            .background(Color("ColorRed"))
            .foregroundColor(.white)
            .cornerRadius(32)
            .shadow(color: Color("ColorRedDark").opacity(0.3),
                    radius: 12,
                    x: 6,
                    y: 8)
        }
    }
}
