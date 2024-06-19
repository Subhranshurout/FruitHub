//
//  AuthenticationScreen.swift
//  FruitHub
//
//  Created by Yudiz Solutions Ltd on 19/06/24.
//

import SwiftUI

struct AuthenticationScreen: View {
    @State var isBtnSheetAnimate : Bool = false
    @State var isFruitAnimate : Bool = false
    @State var isTextAnimate : Bool = false
    @State var isBtnAnimate : Bool = false
    @State var nameTxtField : String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing : 0) {
                Spacer()
                VStack(spacing : 0){
                    Spacer()
                        .frame(height: 155.h)
                    Image("ic_fruits_two")
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
                    Image("ic_fruits_shadow_two")
                        .resizable()
                        .frame(width: 301.w, height: isFruitAnimate ? 18 : 0)
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
                                Text("What is your firstname?")
                                    .font(.custom("BrandonGrotesque-Medium", size: 20))
                                    .foregroundStyle(Color(hex: "27214D"))
                                    .offset(y : isTextAnimate ? 0 : 1000)
                                    .opacity(isTextAnimate ? 1 : 0)
                                    
                                Spacer()
                                    .frame(height: 16)
                                
                                TextField("Tony", text: $nameTxtField)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 14)
                                    .foregroundStyle(Color(hex: "C2BDBD"))
                                    .font(.custom("BrandonGrotesque-Regular", size: 20))
                                    .background(Color(hex: "F3F1F1"))
                                    .clipShape(.rect(cornerRadius: 10))
                                    .offset(y : isTextAnimate ? 0 : 1000)
                                    .opacity(isTextAnimate ? 1 : 0)
                                    
                                Spacer()
                                    .frame(height: 58.h)
                                Button {
//                                    Navigate to Home Screen 
                                } label: {
                                    Text("Start Ordering")
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
                            withAnimation(.snappy) {
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
    AuthenticationScreen()
}
