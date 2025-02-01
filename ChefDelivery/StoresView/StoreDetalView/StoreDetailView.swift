//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 3/7/2024.
//

import SwiftUI

struct StoreDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var selectedProduct: ProductType?
    let storeType: StoreType

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                StoreHeaderView(storeType: storeType)
                StoreDetailProductView(storeType: storeType)
            }
            .navigationTitle(storeType.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack(spacing: 8) {
                            Image(systemName: "cart")
                            Text("Lojas")
                        }
                    }
                    .foregroundColor(Color("ColorRed"))
                }
            }
        }
    }
}

#Preview {
    StoreDetailView(storeType: storesMock[0])
}
