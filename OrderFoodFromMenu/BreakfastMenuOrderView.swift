//
//  BreakfastMenuOrderView.swift
//  OrderFoodFromMenu
//
//  Created by Seth Rojas on 4/5/24.
//

import SwiftUI

struct BreakfastMenuOrderView: View {
    var breakfastOptions: [String] = ["Steak", "Chicken","White Rice"]
    
    @State var isEntreeViewShowing = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    
                    Schedule()
                    
                    OrderNow()
                    
                    Section {
                        Text("Daily Menu")
                            .font(.title)
                            .fontDesign(.serif)
                            .bold()
                            .foregroundStyle(.UABlue)
                        Divider()
                            .background(.black)
                            .padding(.bottom)
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]){
                            ForEach(breakfastOptions, id: \.self){ item in
                                
                                VStack {
                                    Image(item)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding()
                                    
                                    VStack {
                                        Text(item)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .fontDesign(.serif)
                                        Text("200 cal")
                                            .font(.caption)
                                            .foregroundColor(.white.opacity(0.5))
                                            .fontDesign(.monospaced)
                                    }
                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
                                    .background(.FoodColor)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.black)
                                )
                                .padding([.horizontal, .bottom])
                            }
                        } .padding(.horizontal, 25)
                    }
                }
                .padding(.top, -40)
            }
            .toolbar{
                ToolbarItem(placement: .automatic) {
                    Image(systemName: "cart")
                }
                ToolbarItem(placement: .principal) {
                    Image("85logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                }
            }
        }
        .sheet(isPresented: $isEntreeViewShowing){
            SeeEntreView()
        }
    }
    
    func Schedule() -> some View{
        RoundedRectangle(cornerRadius: 25.0)
            .foregroundStyle(.ultraThinMaterial)
            .frame(height: 125)
            .padding()
            .overlay{
                VStack{
                    Text("Schedule")
                        .bold()
                        .font(.title)
                        .fontDesign(.serif)
                        .foregroundStyle(.UABlue)
                    Text("Mon - Fri: 6:00 - 8:00")
                        .underline()
                    Text("Sat - Sun: 9:00 - 8:00")
                        .underline()
                }
            }
    }
    
    func OrderNow() -> some View{
        RoundedRectangle(cornerRadius: 25.0)
            .foregroundStyle(.ultraThinMaterial)
            .frame(height: 150)
            .padding()
            .overlay{
                VStack{
                    Text("Order Ahead")
                        .bold()
                        .font(.title)
                        .fontDesign(.serif)
                        .foregroundStyle(.UABlue)
                    Button{
                        isEntreeViewShowing = true
                    } label: {
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 250 ,height: 50)
                            .foregroundStyle(.FoodColor)
                            .overlay{
                                Text("Customize Entree")
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                    }
                }
            }
    }
}

#Preview {
    BreakfastMenuOrderView()
}
