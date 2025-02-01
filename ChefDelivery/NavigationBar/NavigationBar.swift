//
//  NavigationBar.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 1/7/2024.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack {
            Spacer()
            Button("R. Vergueiro, 1000") {
                
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.black)

            Spacer()

            Button(action: {}) {
                Image(systemName: "bell.badge")
            }
            .font(.title3)
            .foregroundColor(.red)
        }
    }
}

#Preview {
    NavigationBar()
        .previewLayout(.sizeThatFits)
        .padding()
}
