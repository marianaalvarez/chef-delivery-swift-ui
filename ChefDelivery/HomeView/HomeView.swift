//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 1/2/2025.
//

import SwiftUI

struct HomeView: View {
    @State var isAnimating = false
    @State private var imageOffset: CGSize = .zero
    @State private var buttonOffset: CGFloat = .zero
    @State private var showNextScreen = false
    private let buttonHeight: CGFloat = 80
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
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
                
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .padding(isAnimating ? 32 : 92)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(x: imageOffset.width, y: imageOffset.height)
                        .gesture(DragGesture()
                            .onChanged({ gesture in
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    imageOffset = gesture.translation
                            }})
                            .onEnded({ _ in
                                withAnimation(.easeInOut(duration: 0.5)) {
                                imageOffset = .zero
                            }})
                        )
                    ZStack {
                        Capsule()
                            .fill(Color("ColorRed").opacity(0.2))
                        
                        Capsule()
                            .fill(Color("ColorRed").opacity(0.2))
                            .padding(8)
                        
                        Text("Descubra mais")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color("ColorRedDark"))
                            .offset(x: 20)
                        
                        HStack {
                            Capsule()
                                .fill(Color("ColorRed"))
                                .frame(width: buttonOffset + buttonHeight)
                            
                            Spacer()
                        }

                        HStack {
                            ZStack {
                                Circle()
                                    .fill(Color("ColorRed"))
                                
                                Circle()
                                    .fill(Color("ColorRedDark"))
                                    .padding(8)
                                
                                Image(systemName: "chevron.right.2")
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    let gestureWidth = gesture.translation.width
                                    let buttonWidth = geometry.size.width - 60
                                    let dragAreaWidth = buttonWidth - buttonHeight
                                    
                                    if gestureWidth >= 0 && gestureWidth <= dragAreaWidth {
                                        withAnimation(.easeInOut(duration: 0.25)) {
                                            buttonOffset = gestureWidth
                                        }
                                    }
                                })
                                .onEnded({ _ in
                                    let buttonWidth = geometry.size.width - 60
                                    if buttonOffset <= buttonWidth / 2 {
                                        withAnimation(.easeInOut(duration: 0.25)) {
                                            buttonOffset = .zero
                                        }
                                    } else {
                                        showNextScreen = true
                                    }
                                })
                        )
                    }
                    .frame(width: geometry.size.width - 60, height: buttonHeight)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : 100)
                }
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.5)) {
                        isAnimating = true
                    }
                }
            }.fullScreenCover(isPresented: $showNextScreen) {
                ContentView()
            }
        }
    }
}

#Preview {
    HomeView()
}
