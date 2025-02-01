//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 1/2/2025.
//

import SwiftUI

struct HomeView: View {
    @State var isAnimating = false
    
    var body: some View {
        GeometryReader { geometry in
            Circle()
                .foregroundStyle(Color("ColorRed"))
                .frame(width: isAnimating ? 200 : 0)
                .blur(radius: 60)
                .position(x: isAnimating ? 50 : -50, y: isAnimating ? 100 : -100)
                .opacity(isAnimating ? 0.5 : 0)
            
            Circle()
                .foregroundStyle(Color("ColorRedDark"))
                .frame(width: isAnimating ? 200 : 0)
                .blur(radius: 60)
                .position(
                    x: isAnimating ? geometry.size.width - 50 : geometry.size.width + 50,
                    y: isAnimating ? geometry.size.height - 50 : geometry.size.height + 50
                )
                .opacity(isAnimating ? 0.5 : 0)
            
            VStack {
                Text("Chef Delivery")
                    .font(.system(size: 48))
                    .fontWeight(.heavy)
                    .foregroundColor(Color("ColorRed"))
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : -40)
                
                Text("Peça as suas comidas favoritas no conforto da sua casa.")
                    .font(.title2)
                    .padding()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black.opacity(0.7))
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : -40)
                
                Spacer()
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 1.5)) {
                    isAnimating = true
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
