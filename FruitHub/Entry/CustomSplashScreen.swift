//
//  CustomSplashView.swift
//  FruitHub
//
//  Created by Yudiz Solutions Ltd on 18/06/24.
//

import SwiftUI

struct CustomSplashScreen: View {
    @State var rTop : CGFloat = -50
    @State var rleft : CGFloat = -50
    @State var rRight : CGFloat = 50
    @State var opasity_rTop : CGFloat = 0
    @State var opasity_rLeftRight : CGFloat = 0
    
    @State var leaf : CGFloat = -50
    @State var opasity_leaf : CGFloat = 0
    @State var bottomText : CGFloat = 50
    @State var opasity_bottomText : CGFloat = 0
    
    
    @State var opasity_circle : CGFloat = 0
    @State var height_Width : CGFloat = 50
    
    @State var navigateToWelcome: Bool = false
    var body: some View {
        NavigationStack {
            VStack(spacing : 0) {
                HStack(alignment: .bottom, spacing :5.15) {
                    Image("ic_leaf_one")
                        .resizable()
                        .frame(width: 32, height: 37)
                    Image("ic_leaf_two")
                        .resizable()
                        .frame(width: 21, height: 21)
                }
                .offset(x: -5,y: leaf)
                .opacity(opasity_leaf)
                Spacer()
                    .frame(height: 3.96)
                Image("ic_rectangle_top")
                    .resizable()
                    .frame(width: 97, height: 41)
                    .offset(y: rTop)
                    .opacity(opasity_rTop)
                VStack(spacing:0){
                    HStack(spacing: 14.67) {
                        Image("ic_rectangle_leading")
                            .resizable()
                            .frame(width: 32, height: 60)
                            .offset(x : rleft,y: -5)
                            .opacity(opasity_rLeftRight)
                        Image("ic_rectangle_trailing")
                            .resizable()
                            .frame(width: 58, height: 101)
                            .offset(x: rRight)
                            .opacity(opasity_rLeftRight)
                    }
                    Rectangle()
                        .fill(Color(hex: "FFA451"))
                        .frame(width: 184, height: 40)
                        .clipShape(CustomShape(cornerRadius: 16.0, corners: [.bottomRight,.topLeft]))
                        .overlay(alignment: .center) {
                            Text("Fruit Hub")
                                .font(.custom("BadScript-Regular", size: 24))
                                .foregroundStyle(.white)
                        }
                        .opacity(opasity_bottomText)
                        .offset(y : bottomText)
                }
                .offset(x: 10, y : -18)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            .overlay(alignment: .bottomTrailing, content: {
                Circle()
                    .fill(Color(hex: "FFA451"))
                    .frame(width: height_Width, height: height_Width)
                    .opacity(opasity_circle)
                    .offset(x: 400 ,y : 200)
            })
            .ignoresSafeArea()
            .onAppear {
                withAnimation {
                    opasity_rTop = 1
                    rTop = 0
                } completion: {
                    withAnimation {
                        rleft = 0
                        rRight = 0
                        opasity_rLeftRight = 1
                    } completion: {
                        withAnimation {
                            leaf = 0
                            opasity_leaf = 1
                            opasity_bottomText = 1
                            bottomText = 0
                        } completion: {
                            withAnimation (.linear(duration: 0.5)){
                                opasity_circle = 1
                                withAnimation(.linear(duration: 1)){
                                    height_Width = 2000
                                    
                                } completion: {
                                    navigateToWelcome = true
                                }
                            }
                            
                        }
                        
                    }
                }   
            }
            NavigationLink("", isActive: $navigateToWelcome) {
                WelcomeScreen()
            }
        }
    }
}

#Preview {
    NavigationStack {
        CustomSplashScreen()
    }
}
