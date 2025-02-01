//
//  StoreHeaderView.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 19/7/2024.
//

import SwiftUI

struct StoreHeaderView: View {
    let storeType: StoreType

    var body: some View {
        VStack {
            Image(storeType.headerImage)
                .resizable()
                .scaledToFit()
            HStack {
                Text(storeType.name)
                    .font(.title)
                    .bold()
                Spacer()
                Image(storeType.logoImage)
            }
            .padding(.vertical, 8)
            .padding(.horizontal)

            HStack {
                Text(storeType.location)
                    .font(.subheadline)
                Spacer()
                ForEach(1...storeType.stars, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
        }
    }
}

#Preview {
    StoreHeaderView(storeType: storesMock[0])
}
