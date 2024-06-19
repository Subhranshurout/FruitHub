//
//  WelcomeScreen.swift
//  FruitHub
//
//  Created by Yudiz Solutions Ltd on 18/06/24.
//

import SwiftUI

struct WelcomeScreen: View {
    @State var isBtnSheetAnimate : Bool = false
    @State var isFruitAnimate : Bool = false
    @State var isTextAnimate : Bool = false
    @State var isBtnAnimate : Bool = false
    
    
    var body: some View {
        NavigationView {
            VStack(spacing : 0) {
                Spacer()
                VStack(spacing : 0){
                    Spacer()
                        .frame(height: 155.h)
                    Image("ic_fruits_one")
                        .resizable()
                        .frame(width: 301.w, height: isFruitAnimate ? 260.h : 0)
                        .opacity(isFruitAnimate ? 1 : 0)
                        .overlay(alignment: .topTrailing) {
                            Image("ic_small_fruits")
                                .resizable()
                                .frame(width: 50, height: isFruitAnimate ? 37 : 0)
                                .offset(x: -4, y: -24)
                                .opacity(isFruitAnimate ? 1 : 0)
                        }
                    Spacer()
                        .frame(height: 8)
                    Image("ic_fruits_shadow")
                        .resizable()
                        .frame(width: 301.w, height: isFruitAnimate ? 12 : 0)
                        .opacity(isFruitAnimate ? 1 : 0)
                }
                .frame(height: 317.h)
                Spacer()
                VStack(spacing : 0){
                    Spacer()
                    Rectangle()
                        .fill(.white)
                        .frame( height: isBtnSheetAnimate ?  343.h : 0)
                        .opacity(isBtnSheetAnimate ? 1 : 0)
                        .overlay(alignment: .top) {
                            VStack(alignment: .leading,spacing : 0){
                                Text("Get The Freshest Fruit Salad Combo")
                                    .font(.custom("BrandonGrotesque-Medium", size: 20))
                                    .foregroundStyle(Color(hex: "27214D"))
                                    .offset(y : isTextAnimate ? 0 : 1000)
                                    .opacity(isTextAnimate ? 1 : 0)
                                    
                                Spacer()
                                    .frame(height: 8)
                                Text("We deliver the best and freshest fruit salad in town. Order for a combo today!!!")
                                    .font(.custom("BrandonGrotesque-Regular", size: 16))
                                    .offset(y : isTextAnimate ? 0 : 1000)
                                    .opacity(isTextAnimate ? 1 : 0)
                                Spacer()
                                    .frame(height: 58.h)
                                NavigationLink {
                                    AuthenticationScreen()
                                } label: {
                                    Text("Let’s Continue")
                                        .font(.custom("BrandonGrotesque-Medium", size: 16))
                                        .frame(maxWidth: .infinity)
                                        .tint(.white)
                                        .frame(height: 56.h)
                                        .background(Color(hex: "FFA451"))
                                        .clipShape(.rect(cornerRadius: 10))
                                        .offset(y : isBtnAnimate ? 0 : 1000)
                                        .opacity(isBtnAnimate ? 1 : 0)
                                }
                            }
                            .padding(.horizontal,24.w)
                            .padding(.top,56.h)
                        }
                    
                }
                .frame(height: 343.h)
            }
            .ignoresSafeArea()
            .frame(maxHeight: .infinity)
            .background(Color(hex: "FFA451"))
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.snappy(duration: 0.3)) {
                        isBtnSheetAnimate = true
                    } completion: {
                        withAnimation(.snappy(duration: 0.3)){
                            isFruitAnimate = true
                        } completion: {
                            withAnimation(.snappy){
                               isTextAnimate = true
                            } completion: {
                                withAnimation(.snappy) {
                                    isBtnAnimate = true
                                }
                            }

                        }
                        
                    }
                }
            
            }
        }
        .toolbar(.hidden)
    }
}

#Preview {
    WelcomeScreen()
}
