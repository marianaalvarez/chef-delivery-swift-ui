//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 2/7/2024.
//

import SwiftUI

struct StoresContainerView: View {
    @State private var rating: Int = 0
    private let title = "Lojas"
    var stores: [StoreType]
    
    var filteredStores: [StoreType] {
        return stores.filter { store in
            store.stars >= rating
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                Menu("Filtrar") {
                    Button {
                        rating = 0
                    } label: {
                        Text("Limpar filtro")
                    }
                    Divider()
                    ForEach(1...5, id: \.self) { stars in
                        Button {
                            rating = stars
                        } label: {
                            if stars > 1 {
                                Text("\(stars) estrelas ou mais")
                            } else {
                                Text("1 estrela ou mais")
                            }
                        }
                    }
                }
            }
            .foregroundColor(.black)
            VStack(alignment: .leading, spacing: 20) {
                if filteredStores.isEmpty {
                    Text("Nenhum resultado encontrado.")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(Color("ColorRed"))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 32)
                } else {
                    ForEach(filteredStores) { mock in
                        NavigationLink {
                            StoreDetailView(storeType: mock)
                        } label: {
                            StoreItemView(storeType: mock)
                        }
                    }
                }
            }
            .foregroundColor(.black)
        }
        .padding(20)
    }
}

#Preview {
    StoresContainerView(stores: storesMock)
}
