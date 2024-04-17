//
//  CheckoutView.swift
//  OrderFoodFromMenu
//
//  Created by Seth Rojas on 3/12/24.
//

import SwiftUI

struct CheckoutView: View {
    @Environment(OrderEntree.self) var orders
    var frameDouble = 50.0
    
    func sectionDivider() -> some View{
        RoundedRectangle(cornerRadius: 25.0)
            .frame(width: UIScreen.main.bounds.width, height: 1)
            .foregroundStyle(.brown)
    }
    

    
    func ShowFoodViewCircle(names: [String]) -> some View{
        
        HStack{
            ForEach(names, id: \.self){ name in
                ZStack{
                    Circle()
                        .stroke(.black, lineWidth: 1.0)
                        .foregroundStyle(.clear)
                        .padding(5)
                    
                    Image(name)
                        .resizable()
                        .clipShape(Circle())
                        .scaledToFit()
                        .padding(5)
                }
            }
        }
    }
    
    var body: some View {
        VStack{
            Text("ORDERS")
                .underline(pattern: .solid, color: .black)
                .headerText()
                .bold()
                .padding(.bottom,40)
                .padding(.top, 10)
            Button("Clear") {
                orders.allOrders.removeAll()
                orders.save()
            }
            
            Section{
                HStack{
                    Text("RECENTS")
                        .headerText()
                        .padding(.horizontal)
                    Spacer()
                }
                sectionDivider()
                ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]){
                        ForEach(orders.allOrders.reversed()){ order in
                            VStack{
                                Image(order.name)
                                    .resizable()
                                    .scaledToFit()
                                Text(order.name)
                                    .foregroundStyle(.UABlue)
                                    .fontDesign(.serif)
                                    .underline(pattern: .solid, color: .FoodColor)
                                HStack{
                                    ShowFoodViewCircle(names: [order.protein])
                                    ShowFoodViewCircle(names: [order.rice])
                                    ShowFoodViewCircle(names: [order.bean])
                                    
                                }
                                ShowFoodViewCircle(names: order.addOns)
                                
                                
                            }
                            .frame(width: 150, height: 150)
                            .border(Color.black)
                            .padding()
                            
                            
                            
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    CheckoutView()
        .environment(OrderEntree())
}
