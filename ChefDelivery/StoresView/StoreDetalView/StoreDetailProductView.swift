//
//  StoreDetailProductView.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 19/7/2024.
//

import SwiftUI

struct StoreDetailProductView: View {
    @State var selectedProduct: ProductType?
    let storeType: StoreType

    var body: some View {
        Text("Produtos")
            .font(.title2)
            .bold()
            .padding()
        
        ForEach(storeType.products) { product in
            Button {
                selectedProduct = product
            } label: {
                StoreDetailProductItemView(product: product)
            }
            .sheet(item: $selectedProduct) { product in
                ProductDetailView(product: product)
            }
        }
    }
}

#Preview {
    StoreDetailProductView(storeType: storesMock[0])
}
