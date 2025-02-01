//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 2/7/2024.
//

import SwiftUI

struct StoreItemView: View {
    let storeType: StoreType
    
    var body: some View {
        HStack(spacing: 10) {
            Image(storeType.logoImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50, height: 50)
            Text(storeType.name)
                .font(.subheadline)
            Spacer()
        }
    }
}

#Preview {
    StoreItemView(storeType: storesMock[0])
}
