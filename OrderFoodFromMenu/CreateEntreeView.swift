//
//  CreateEntreeView.swift
//  OrderFoodFromMenu
//
//  Created by Seth Rojas on 3/12/24.
//

import SwiftUI

struct CreateEntreeView: View {
    var entreeString: String
    
    var proteinOptions: [String] = ["Steak", "Chicken", "Carnitas", "Beef Barbacoa"]
    var beanOptions: [String] = ["Black Beans" , "Pinto Beans"]
    var riceOptions: [String] = ["White Rice", "Brown Rice"]
    var addOnOptions: [String] = ["Cheese", "Chili-Corn Salsa", "Fajitas Veggies", "Romaine Lettuce", "Salsa", "Sour Cream"]
    
    @State var proteinChoice: String = ""
    @State var beanChoice: String = ""
    @State var riceChoice: String = ""
    @State var addOnChoices: [String] = []
    @State var bProteinArr: [Bool] = Array(repeating: false, count: 4)
    @State var bBeanArr: [Bool] = Array(repeating: false, count: 2)
    @State var bRiceArr: [Bool] = Array(repeating: false, count: 2)
    @State var bAddOnsArr: [Bool] = Array(repeating: false, count: 6)
    
    @Environment(OrderEntree.self) var orderEntree
    var imageFrameSize = 75.0
    
    @Environment(\.dismiss) var dismiss
    
    func unfilledFoodIcon() -> some View{
        Circle()
            .stroke(.black, lineWidth: 1.0)
            .frame(width: imageFrameSize + 10, height: imageFrameSize + 10)
    }
    
    func filledFoodIcon() -> some View{
        Circle()
            .stroke(.black, lineWidth: 1.0)
            .frame(width: imageFrameSize + 10, height: imageFrameSize + 10)
            .background{
                Circle().frame(width: imageFrameSize + 10, height: imageFrameSize + 10)
                    .foregroundStyle(.FoodColor)
                    .opacity(1)
            }
    }

    
    func foodSectionHeader(name: String) -> some View{
        VStack{
            HStack{
                Text(name)
                    .font(.title)
                    .fontDesign(.default)
                    .foregroundStyle(.gray)
                    .underline(pattern: .solid, color: .UABlue)
                    .bold()
                    .padding(.horizontal)
                Spacer()
            }
            Divider()
                .padding(.top, -5)
        }
    }
    
    var body: some View {
        ZStack{
            ScrollView{
                
                VStack{
                    VStack{
                        Text("Build Your")
                            .foregroundStyle(.UABlue)
                            .font(.title)
                            .padding(.top)
                        Text(entreeString)
                            .font(.largeTitle)
                            .bold()
                        Image(entreeString)
                            .resizable()
                            .scaledToFit()
                    }
                    .foregroundStyle(.FoodColor)
                    .fontDesign(.serif)
                    
                    Section{
                        foodSectionHeader(name: "Protein")
                        ForEach(0..<proteinOptions.count, id: \.self){ item in
                            Button{
                                proteinChoice = proteinOptions[item]
                                bProteinArr[item].toggle()
                            } label: {
                                HStack{
                                    ZStack{
                                        if(bProteinArr[item]){
                                            filledFoodIcon()
                                        } else{
                                            unfilledFoodIcon()
                                        }

                                        Image(proteinOptions[item])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: imageFrameSize, height: imageFrameSize)
                                    }
                                    Text(proteinOptions[item])
                                        .foregroundStyle(.FoodColor)
                                        .blueTitle()
                                    
                                    Spacer()
                                }.padding()
                            }
                            
                        }
                        foodSectionHeader(name: "Rice")
                        ForEach(0..<riceOptions.count, id: \.self){ item in
                            Button{
                                riceChoice = riceOptions[item]
                                bRiceArr[item].toggle()
                            } label: {
                                HStack{
                                    ZStack{
                                        if(bRiceArr[item]){
                                            filledFoodIcon()
                                        } else{
                                            unfilledFoodIcon()
                                        }

                                        Image(riceOptions[item])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: imageFrameSize, height: imageFrameSize)
                                    }
                                    Text(riceOptions[item])
                                        .foregroundStyle(.FoodColor)
                                        .blueTitle()
                                    
                                    Spacer()
                                }.padding()
                            }
                            
                        }
                        foodSectionHeader(name: "Beans")
                        ForEach(0..<beanOptions.count, id: \.self){ item in
                            Button{
                                beanChoice = beanOptions[item]
                                bBeanArr[item].toggle()
                            } label: {
                                HStack{
                                    ZStack{
                                        if(bBeanArr[item]){
                                            filledFoodIcon()
                                        } else{
                                            unfilledFoodIcon()
                                        }

                                        Image(beanOptions[item])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: imageFrameSize, height: imageFrameSize)
                                    }
                                    Text(beanOptions[item])
                                        .foregroundStyle(.FoodColor)
                                        .blueTitle()
                                    
                                    Spacer()
                                }.padding()
                            }
                            
                        }
                        foodSectionHeader(name: "Add-ons")
                        ForEach(0..<addOnOptions.count, id: \.self){ item in
                            Button{
                                bAddOnsArr[item].toggle()
                            } label: {
                                HStack{
                                    ZStack{
                                        if(bAddOnsArr[item]){
                                            filledFoodIcon()
                                        } else{
                                            unfilledFoodIcon()
                                        }

                                        Image(addOnOptions[item])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: imageFrameSize, height: imageFrameSize)
                                    }
                                    Text(addOnOptions[item])
                                        .foregroundStyle(.FoodColor)
                                        .blueTitle()
                                    
                                    Spacer()
                                }.padding()
                            }
                            
                        }
                        
                        
                    }
                }
            }
            
            VStack{
                Spacer()

                Button
                {
                    
                    let proteinIndex = bProteinArr.firstIndex(where: {$0 == true}) ?? 0
                    let beanIndex = bBeanArr.firstIndex(where: {$0 == true}) ?? 0

                    let riceIndex = bRiceArr.firstIndex(where: {$0 == true}) ?? 0
                    for item in 0..<bAddOnsArr.count{
                        if(bAddOnsArr[item] == true){
                            addOnChoices.append(addOnOptions[item])
                        }
                    }
                            
                    proteinChoice = proteinOptions[proteinIndex]
                    beanChoice = beanOptions[beanIndex]
                    riceChoice = riceOptions[riceIndex]
                    
                    orderEntree.allOrders.append(Entree(name: entreeString, protein: proteinChoice, bean: beanChoice, rice: riceChoice, addOns: addOnChoices))
                    orderEntree.save()
                    dismiss()
                    
                    
                } label: {
                    RoundedRectangle(cornerRadius: 25.0)
                        .padding()
                        .padding(.horizontal, 20)
                        .frame(height: 75)
                        .foregroundStyle(.FoodColor)
                        .overlay{
                            Text("ORDER")
                                .foregroundStyle(.white)
                                .font(.system(size: 25))
                                .fontDesign(.default)
                                .bold()
                        }
                        .shadow(radius: 10)
                }
            }
        }
    }
        
}

#Preview {
    CreateEntreeView(entreeString: "Burrito")
        .environment(OrderEntree())
}
