//
//  StationsMenuView.swift
//  OrderFoodFromMenu
//
//  Created by Seth Rojas on 4/8/24.
//

import SwiftUI

struct StationsMenuView: View {
    var stationNames = ["Breakfast", "Grill",  "Salad", "Pasta"]
    var stationBios = ["Eggs & Eggs", "Tasty & Smokin'" , "Healthy & Green", "A Bite of Dough"]
    
    @State var isAbout85NorthPresent = false
    @State var isCartPresent = false
    
    var body: some View {
        NavigationStack{
            
            ScrollView{
                
            VStack{
                
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(.ultraThinMaterial)
                    .frame(height: 200)
                    .padding()
                    .overlay {
                        HStack{
                            VStack{
                                VStack{
                                    Text("It's an")
                                        .blueTitle()
                                        .multilineTextAlignment(.center)
                                    Text(" \"HONOR\" ")
                                        .foregroundStyle(.FoodColor)
                                        .font(.system(size: 32))
                                        .blueTitle()
                                }
                                .padding(.leading)
                                
                                Button{
                                    isAbout85NorthPresent = true
                                } label: {
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .frame(width: 175, height: 50)
                                        .foregroundStyle(.UABlue)
                                        .overlay{
                                            Text("About '85 North")
                                                .fontDesign(.serif)
                                                .foregroundStyle(.white)
                                                .underline()
                                        }
                                        .padding(.leading, 25)
                                }
                            }
                            Image("Wildcat")
                                .resizable()
                                .scaledToFit()
                                .padding(.trailing)
                        }
                    }.padding(.top, -35)

                
                Section{
                    Text("Stations")
                        .font(.largeTitle)
                        .blueTitle()

                    Divider()
                        .foregroundStyle(.black)
                        .padding(.top, -10)
                    
                    ForEach(0..<stationNames.count, id: \.self){stat in
                        NavigationLink {
                            SeeStationView(stationName: stationNames[stat])
                        } label: {
                            RoundedRectangle(cornerRadius: 25.0)
                                .foregroundStyle(.ultraThinMaterial)
                                .padding()
                                .frame(height: 100)
                                .overlay{
                                    HStack{
                                        Image(stationNames[stat])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .padding(.leading, 40)
                                        
                                        HStack{
                                            
                                            VStack (alignment: .leading){
                                                Text(stationNames[stat])
                                                    .font(.title)
                                                    .fontDesign(.serif)
                                                    .bold()
                                                    .underline()
                                                
                                                Text(stationBios[stat])
                                                    .font(.caption)
                                                    .foregroundStyle(.black)
                                            }
                                            
                                            Spacer()
                                            
                                            if(stationNames[stat] == "Breakfast" || stationNames[stat] == "Grill"){
                                                Circle()
                                                    .frame(width: 40, height: 40)
                                                    .padding([.top, .trailing, .bottom])
                                                    .overlay {
                                                        Text("Online")
                                                            .font(.system(size: 10))
                                                            .foregroundStyle(.white)
                                                            .padding(.trailing, 15)
                                                            .fontDesign(.serif)
                                                    }
                                            }

                                            
                                        }
                                        .foregroundStyle(.FoodColor)
                                        .padding(.leading)
                                        Spacer()
                                        
                                    }
                                }
                        }

                    }
                }
                    
                    
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        isCartPresent = true
                    } label: {
                        Image(systemName: "cart")
                            .padding([.top, .trailing])
                            .foregroundColor(.black)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Image("85logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .padding()
                }
            }

            .sheet(isPresented: $isAbout85NorthPresent, content: {
                Text("Hello World!")
            })
            .sheet(isPresented: $isCartPresent, content: {
                CheckoutView()
            })
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
                    VStack{
                        Text("Mon - Fri: 6:00 - 8:00")
                            .underline()
                        Text("Sat - Sun: 9:00 - 8:00")
                            .underline()
                    }.bold()
                }
            }
    }
}

#Preview {
    StationsMenuView()
}
