//
//  OrderHomeScreen.swift
//  OrderFoodFromMenu
//
//  Created by Seth Rojas on 3/13/24.
//

import SwiftUI

struct OrderHomeScreen: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Image("85north")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .blur(radius: 2.0)
                
                VStack{
                    HStack{
                        Image("UALogo")
                            .resizable()
                            .frame(width: 150, height: 150)
                    }
                    
                    RoundedRectangle(cornerRadius: 25.0)
                        .overlay {
                            VStack{
                                VStack{
                                    Text("HELLO, WELCOME TO")
                                        .font(.title)
                                        .foregroundStyle(.FoodColor)
                                        .fontDesign(.monospaced)
                                    Image("85logo")
                                        .resizable()
                                        .scaledToFit()
                                }
                                .padding()
                                
                                NavigationLink {
                                    SeeEntreView()
                                } label: {
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .overlay{
                                            Text("ORDER NOW")
                                                .foregroundStyle(.white)
                                                .fontDesign(.monospaced)
                                                .bold()
                                        }
                                        .frame(width: 200, height: 50)
                                        .foregroundStyle(.FoodColor)
                                        .padding(.bottom)
                                }
                            }
                        }
                        .frame(width: 350, height: 250)
                        .padding()
                        .foregroundStyle(.white)
                        .opacity(0.9)
                }
            }
            
            
        }

    }
}

#Preview {
    OrderHomeScreen()
}
