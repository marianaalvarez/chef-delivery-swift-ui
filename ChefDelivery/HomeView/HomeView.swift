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
                .frame(width: 200)
                .blur(radius: 60)
                .position(CGPoint(x: 50, y: 100))
                .opacity(0.5)
            
            Circle()
                .foregroundStyle(Color("ColorRedDark"))
                .frame(width: 200)
                .blur(radius: 60)
                .position(CGPoint(x: geometry.size.width - 50, y: geometry.size.height - 50))
                .opacity(0.5)
            
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
